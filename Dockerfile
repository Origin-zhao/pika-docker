FROM centos:centos7
MAINTAINER joyuan <enginezy@gmail.com>
ARG VERSION=v3.0.7
ARG PORT=6379
#RUN #rpm -ivh https://mirrors.ustc.edu.cn/epel/epel-release-latest-7.noarch.rpm && \
    #yum -y update && \
    #yum -y install snappy-devel && \
    #yum -y install protobuf-devel && \
    #yum -y install gflags-devel && \
    #yum -y install glog-devel && \
    #yum -y install gcc-c++ && \
    #yum -y install which && \

RUN yum install wget tar bzip2 -y && \    
    mkdir /pika && cd /pika && \   
    wget -O pick.tar.bz2 "https://github.com/Qihoo360/pika/releases/download/${VERSION}/pika-linux-x86_64-${VERSION}.tar.bz2" && \
    tar -jxvf pick.tar.bz2 -C /pika/ --strip-components=2 && rm pick.tar.bz2 && \
    pwd && ls -l && \
    sed -i '2c port : ${PORT}' /pika/pika.conf && \ 
    echo "Asia/shanghai" > /etc/timezone

ENV PIKA  /pika
VOLUME /pika
WORKDIR ${PIKA}
ENV PATH ${PIKA}/bin:${PATH}
WORKDIR ${PIKA}
EXPOSE ${PORT}
CMD ["pika","-c","/pika/pika.conf"]
