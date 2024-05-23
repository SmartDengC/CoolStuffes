# CoolStuffes
SHARE MY COOL STUFF TO MY FRIENDS

The repositories save some that makes me fast in work, called work flow. 
For example karabiner ideavim and so on.
Reference from [LintaoAmons/CoolStuffes](https://github.com/LintaoAmons/CoolStuffes)

## Share my cool stuff to my friends
Please give a little start if you found it useful, because some of them spend me a lot of time to find the current result

## Backup Description

### 1、备份与恢复hammerspoon的配置

hammerspoon的配置文件在家目录的`.hammerspoon`下面，备份与恢复的时候只需要把这个文件下面的所有内容拷贝或者替换调就可以。

当前在仓库的主目录下面

```shell
(base) ➜ CoolStuffes (main) ✗ ls
README.md   hammerspoon karabiner
```

直接将.hammerspoon下面的所有内容都拷贝到仓库的主目录下面，然后在提交。

```shell
cp -r ~/.hammerspoon/* ./hammerspoon
```

### 2、备份与恢复karabiner的配置

karabiner同理，karabiner的配置文件在家目录的`.config`下面.

```shell
(base) ➜ CoolStuffes (main) ✔ pwd   // 当前所处的目录
/Users/dengc4r/c4r_git/CoolStuffes

(base) ➜ CoolStuffes (main) ✔ ls  // 当前目录的目录结构
README.md   hammerspoon karabiner  

(base) ➜ CoolStuffes (main) ✗ cp -r ~/.config/karabiner/* ./karabiner  // 将需要上传的内容复制过来
```

