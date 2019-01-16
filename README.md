# 360 pika-docker 基于 centos7
# 执行命令
``` bash
docker run --name pika  registry.cn-hangzhou.aliyuncs.com/origin/pika:v3.0.6
# 安装指定版本
docker run --name pika -e VERSION=v3.0.6 -e PORT=3306 registry.cn-hangzhou.aliyuncs.com/origin/pika:v3.0.6
```
