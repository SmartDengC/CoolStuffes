# Share my CoolStuffes
仓库中保存了一些是我在工作中高效率的配置，也可以叫做工作流，例如karabiner、hammerspoon、ideavim。

如果有什么问题，欢迎大家指出。

### 一、备份与恢复Hammerspoon的配置

#### 1.1、备份Hammerspoon配置

hammerspoon的配置文件在目录`.hammerspoon`下面，备份与恢复的时候只需要把这个文件下面的所有内容拷贝或者替换掉就可以。

我们首先切换到仓库的主目录，ls查看目录下面的文件夹：

```shell
(base) ➜ CoolStuffes (main) ✗ cd /Users/dengc4r/c4r_git/CoolStuffes
(base) ➜ CoolStuffes (main) ✗ ls
README.md   hammerspoon karabiner
```

直接将.hammerspoon下面的所有内容都拷贝到仓库的主目录下面，然后在提交。

```shell
cp -r ~/.hammerspoon/* ./hammerspoon
```

上面部分我们还是使用的相对路径，这里我们也可以直接使用绝对路径来操作：

```shell
cp -r ~/.hammerspoon/* /Users/dengc4r/c4r_git/CoolStuffes/hammerspoon
```

#### 1.2、恢复Hammerspoon配置

操作会将文件拷贝到Hammerspoon的主目录下，操作前建议将原文件夹进行备份。

```shell
(base) ➜ ~ cp -r ~/.hammerspoon ~/.hammerspoon-bak
```

在仓库主目录拉取Github代码之后，就在当前目录上将Hammerspoon里面的所有文件拷贝到本地目录的Hammerspoon文件夹里面。

```shell
(base) ➜ c4r_git cd CoolStuffes
(base) ➜ CoolStuffes (main) ✔ ls
README.md   hammerspoon ideavim     karabiner   lazyvim     zsh
(base) ➜ CoolStuffes (main) ✔ cp -r ./hammerspoon/* ~/.hammerspoon
```

### 二、备份与恢复karabiner的配置

karabiner同理，karabiner的配置文件在家目录的`.config`下面.

#### 2.1、备份karabiner的配置

```shell
(base) ➜ CoolStuffes (main) ✔ pwd   // 当前所处的目录
/Users/dengc4r/c4r_git/CoolStuffes

(base) ➜ CoolStuffes (main) ✔ ls  // 当前目录的目录结构
README.md   hammerspoon karabiner  

(base) ➜ CoolStuffes (main) ✗ cp -r ~/.config/karabiner/* ./karabiner  // 将需要上传的内容复制过来
```

#### 2.2、恢复karabiner的配置

同步某一个文件到karabiner配置目录

```shell
(base) ➜ CoolStuffes (main) ✗ pwd
/Users/dengc4r/c4r_git/CoolStuffes
(base) ➜ CoolStuffes (main) ✗ cp -r ./karabiner/assets/complex_modifications/left_shift_2_F17.json ~/.config/karabiner/assets/complex_modifications/
```

使用github上面文件全部替换本地karabiner配置：

```shell
(base) ➜ c4r_git cd CoolStuffes
(base) ➜ CoolStuffes (main) ✗ pwd
/Users/dengc4r/c4r_git/CoolStuffes
(base) ➜ CoolStuffes (main) ✗ cp -r ./karabiner/* ~/.config/karabiner
```

