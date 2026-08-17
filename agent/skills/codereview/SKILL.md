---
name: codereview
description: 对指定用户的代码提交进行 code review，排除 merge commit。用于用户说"帮我 review 代码"、"code review"、"审查代码"等场景。
---

# Code Review

这个 skill 帮助你对代码提交进行 code review。

## 当使用这个 skill

当用户请求：
- "帮我 review 代码"
- "code review"
- "审查代码"
- "检查代码问题"
- "帮我看看上次提交的代码"
- 其他类似的代码审查请求

## Code Review 流程

### Step 1: 获取用户信息

从用户的请求中确定：
1. GitHub/GitLab 用户名
2. 要 review 的分支（默认当前分支）
3. 是否排除 merge commit（默认排除）

### Step 2: 获取提交历史

使用以下命令获取指定用户的非 merge commit：

```bash
# 获取当前分支上指定用户的最后一次提交
git log --author="username" --no-merges -1

# 获取指定用户的所有非 merge 提交
git log --author="username" --no-merges --oneline -n 20

# 获取某个分支上指定用户的提交
git log --author="username" --no-merges branch_name --oneline
```

### Step 3: 获取提交详情

```bash
# 获取提交的详细 diff
git show <commit-hash> --stat

# 获取完整的代码变更
git show <commit-hash>
```

### Step 4: 进行 Code Review

分析以下方面：
1. **代码质量**：代码风格、可读性、命名规范
2. **潜在问题**：Bug、内存泄漏、空指针等
3. **优化建议**：性能、架构、可维护性
4. **安全漏洞**：SQL 注入、XSS、敏感信息泄露
5. **最佳实践**：是否符合项目规范

### Step 5: 输出 Review 结果

按照以下格式输出：

```markdown
## Code Review 报告

### 提交信息
- **提交者**: username
- **提交 hash**: abc1234
- **提交信息**: commit message
- **变更文件**: 5 files changed

### 总体评价
[简要说明]

### 问题列表

#### 🔴 严重问题
1. [问题描述]
   - 文件: path/to/file
   - 行号: 123
   - 推荐修改代码:
   ```java
   // 推荐的修改方式
   ```

#### 🟡 警告
1. [问题描述]
   - 文件: path/to/file
   - 行号: 456
   - 推荐修改代码:
   ```java
   // 推荐的修改方式
   ```

#### 💡 优化建议
1. [建议描述]
   - 文件: path/to/file
   - 行号: 789
   - 推荐修改代码:
   ```java
   // 推荐的修改方式
   ```
```

## 常用命令参考

| 场景 | 命令 |
|------|------|
| 查看某用户的最新提交 | `git log --author="username" --no-merges -1` |
| 查看某用户的提交列表 | `git log --author="username" --no-merges --oneline -n 10` |
| 查看提交详情 | `git show <commit>` |
| 查看两个分支的差异 | `git diff branch1..branch2` |
| 查看某个文件的变更历史 | `git log -p filename` |

## 注意事项

1. 始终排除 merge commit（使用 `--no-merges` 参数）
2. 如果用户没有指定用户名，询问用户
3. 如果是多个提交，可以总结整体趋势或逐个分析
4. 尊重项目的代码规范和风格
5. 提出建设性的建议，而非单纯的批评
6. **重要**: 每个问题后面必须给出推荐修改的代码（如果适用），代码要符合项目规范
