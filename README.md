# ssh-tool



## 项目简介

这是一个使用python+expect脚本，直接连接服务器的项目



## 分支介绍

| 分支名称           | 功能描述                                        |
| :----------------- | ----------------------------------------------- |
| main               | 直连服务器（仅支持python2）                     |
| tool-python3       | 直连服务器（仅支持python3）                     |
| UAuditHost-python2 | 使用relay登录目标机器（仅支持python2）          |
| UAuditHost-python3 | 使用relay登录目标机器（仅支持python3）          |
| menshen-python2    | 使用门神登录目标机器，需要密码（仅支持python2） |
| menshen-python3    | 使用门神登录目标机器，需要密码（仅支持python3） |



## 使用步骤



### 环境准备

1、确保你的机器上已经安装python（注意python版本，拉取对应的分支） 

2、安装 expect   。 mac (brew install expect) 



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
配置说明：
ControlPersist为长连接，打开之后即使关闭了所有relay的ssh连接，一段时间内也能无需密码重新连接。
ControlMaster配合ControlPath一起使用，当打开了一个relay的ssh连接之后，再次打开无需重复输入密码，但是关闭所有连接后，再次连接relay仍需输入密码。
Compression为压缩选项，打开之后加快数据传输速度。

### 2、配置目标服务器信息（host文件）

你首先需要在hosts文件里面配置好你的服务器账号密码端口等信息后，然后就可以是使用relay进行登录。

使用空格分开

| 分支名称           | host文件格式                 |
| :----------------- | ---------------------------- |
| main               | ip 22 root xxxxxxxx hostname |
| tool-python3       | ip 22 root xxxxxxxx hostname |
| UAuditHost-python2 | ip root password hostname    |
| UAuditHost-python3 | ip root password hostname    |
| menshen-python2    | ip root hostname             |
| menshen-python3    | ip root hostname             |



### 	3、跳板机配置（login.sh文件）

​	   需要配置下login.sh信息

​		分别为：跳板机的 主机地址、账号、密码

```
UAuditHost=""
UAuditUser=""
UAuditPassword=""
```



### 4、环境变量

如果你想要在任何地方使用这个脚本，请加入环境变量

```shell
echo 'export PATH=$PATH:/Users/jack/relay_auto_login_script '  >> ~/.bash_profile
echo 'export PATH=$PATH:/Users/jack/menshen '  >> ~/.bash_profile
```

### 5、使用

执行relay或者menshen 命令，打开手机如流，进行认证后登录

