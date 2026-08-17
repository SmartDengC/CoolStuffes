---
name: mysql-alter-generator
description: 根据MySQL建表语句和指定字段名，生成ALTER TABLE ADD COLUMN语句。用于"生成ALTER语句"、"根据建表语句添加字段"、"生成MySQL ADD COLUMN"等场景。
---

# MySQL ALTER 语句生成器

这个 skill 帮助你根据 MySQL 建表语句和指定字段名，生成对应的 ALTER TABLE ADD COLUMN 语句。

## 使用场景

当用户请求：
- "根据这个建表语句生成 ALTER 语句"
- "帮我生成添加字段的 ALTER 语句"
- "从 CREATE TABLE 提取字段生成 ALTER"
- "生成 MySQL ADD COLUMN 语句"

## 工作流程

### Step 1: 接收输入

从用户获取：
1. **建表语句** (CREATE TABLE)
2. **字段名列表** (单个或多个字段名，用逗号分隔)

### Step 2: 解析建表语句

从 CREATE TABLE 语句中提取：

1. **表名** - 从 `CREATE TABLE \`表名\`` 中提取
2. **字段定义** - 提取每个字段的完整定义：
   - 字段名
   - 数据类型 (int, varchar, bigint, double, date, datetime, tinyint 等)
   - 长度 (如 varchar(255), int(11))
   - COLLATE 设置
   - DEFAULT 值
   - COMMENT 注释
   - NULL/NOT NULL 约束

### Step 3: 匹配字段

**匹配规则：大小写敏感**

- 字段名必须与建表语句中的字段名完全一致（包括大小写）
- 如果字段名在建表语句中找不到，明确提示用户

示例：
```
用户输入: bom_quantity
建表语句中: BOM_QUANTITY
结果: 匹配失败，提示用户 "字段 'bom_quantity' 未在建表语句中找到，请检查大小写"
```

### Step 4: 生成 ALTER 语句

生成标准 ALTER TABLE ADD COLUMN 语句：

```sql
ALTER TABLE `表名` 
ADD COLUMN `字段名1` 类型 [COLLATE] [DEFAULT 值] [NULL/NOT NULL] COMMENT '注释',
ADD COLUMN `字段名2` 类型 [COLLATE] [DEFAULT 值] [NULL/NOT NULL] COMMENT '注释';
```

**注意事项：**
- 多个字段用逗号分隔，最后一个字段后用分号结束
- 保留原始字段定义中的所有属性（COLLATE、DEFAULT、COMMENT 等）
- 不包含 PRIMARY KEY、UNIQUE、INDEX 等约束定义

### Step 5: 输出结果

输出格式：

```markdown
## ALTER TABLE 语句

```sql
ALTER TABLE `表名` 
ADD COLUMN `字段名` ...;
```

### 字段匹配结果
| 字段名 | 状态 | 说明 |
|--------|------|------|
| BOM_QUANTITY | 已匹配 | double DEFAULT NULL COMMENT '数量' |
| BOM_LOCATION | 已匹配 | varchar(255) ... |
| unknown_field | 未匹配 | 请检查字段名拼写或大小写 |
```

## 完整示例

### 输入
```
建表语句：
CREATE TABLE `t_prm_cut_work_order_consume` (
  `ID` bigint NOT NULL AUTO_INCREMENT COMMENT '主键 ID',
  `MAT_CTRL` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物料控制码',
  `BOM_QUANTITY` double DEFAULT NULL COMMENT '数量',
  `BOM_LOCATION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '位置',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

需要生成ALTER的字段：BOM_QUANTITY, BOM_LOCATION
```

### 输出

```markdown
## ALTER TABLE 语句

```sql
ALTER TABLE `t_prm_cut_work_order_consume` 
ADD COLUMN `BOM_QUANTITY` double DEFAULT NULL COMMENT '数量',
ADD COLUMN `BOM_LOCATION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '位置';
```

### 字段匹配结果
| 字段名 | 状态 | 字段定义 |
|--------|------|----------|
| BOM_QUANTITY | 已匹配 | double DEFAULT NULL COMMENT '数量' |
| BOM_LOCATION | 已匹配 | varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '位置' |
```

## 字段定义提取规则

提取字段定义时，需要处理以下格式：

| 元素 | 示例 | 说明 |
|------|------|------|
| 字段名 | \`FIELD_NAME\` | 反引号包裹 |
| 数据类型 | bigint, varchar(255), double | 必须保留 |
| COLLATE | COLLATE utf8mb4_general_ci | 可选，字符类型字段 |
| NULL约束 | NULL, NOT NULL | 可选 |
| DEFAULT | DEFAULT NULL, DEFAULT 0, DEFAULT 'value' | 可选 |
| AUTO_INCREMENT | AUTO_INCREMENT | 可选 |
| COMMENT | COMMENT '注释内容' | 可选 |

**字段定义边界识别：**
- 字段定义以逗号 `,` 或右括号 `)` 结束
- 注意处理 COMMENT 中可能包含的引号
- 忽略 PRIMARY KEY、UNIQUE KEY、INDEX、FOREIGN KEY 等表级约束

## 错误处理

### 1. 字段不存在
当指定的字段名在建表语句中找不到时：

```markdown
### 匹配失败的字段
以下字段未在建表语句中找到，请检查：

- `unknown_field` - 请确认字段名拼写和大小写是否正确
```

### 2. 建表语句格式错误
当无法正确解析建表语句时：

```markdown
无法解析建表语句，请检查：
1. 是否为有效的 CREATE TABLE 语句
2. 是否使用标准 MySQL 语法
3. 字段定义格式是否正确
```

### 3. 多表处理
如果用户提供了多个 CREATE TABLE 语句：

```markdown
检测到多个建表语句，请明确指定：
1. 需要操作的表名
2. 或分别为每个表生成 ALTER 语句
```

## 兼容性说明

生成的标准 ALTER TABLE ADD COLUMN 语句兼容所有 MySQL 版本和 MariaDB。