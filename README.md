# ssh-tool



## 项目简介

这是一个使用python+expect脚本，直接连接服务器的项目



## 分支介绍

| 分支名称           | 功能描述                            |      |
| :----------------- | ----------------------------------- | ---- |
| main               | 支持使用python2连接服务器           |      |
| tool-python3       | 支持使用python3连接服务器           |      |
| UAuditHost-python2 | 支持使用python2自动登录跳板机服务器 |      |
| UAuditHost-python3 | 支持使用python2自动登录跳板机服务器 |      |



## 使用步骤

确保你的机器上已经安装python 跟 expect。

### 1、ssh 配置

首先需要在 ~/.ssh/config的配置文件中写入以下内容

```

Host *
ControlPersist yes
ControlMaster auto
ControlPath ~/.ssh/master-%r@%h:%p
Compression yes
HostkeyAlgorithms +ssh-rsa
PubkeyAcceptedKeyTypes +ssh-rsa
```

### 2、配置你的服务器信息

你首先需要在hosts文件里面配置好你的服务器账号密码端口等信息后，然后就可以是使用relay进行登录。

比如，使用空格分开

```
myserverhost 22 root xxxxxxxx test
```

#### 	2.1、如果使用跳板机连接

​	   需要配置下login.sh信息

​		分别为：跳板机的 主机地址、账号、密码

```
UAuditHost=""
UAuditUser=""
UAuditPassword=""
```



### 3、环境变量

如果你想要在任何地方使用这个脚本，请加入环境变量

```shell
echo 'export PATH=$PATH:/Users/jack/relay_auto_login_script '  >> ~/.bash_profile 
```

### 4、使用

执行relay 命令

