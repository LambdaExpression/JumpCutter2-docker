FROM alpine:3.14.0

MAINTAINER lambdaexpression <lambdaexpression@163.com>

WORKDIR /root/tmp
RUN apk update
RUN apk add --update --no-cache curl jq py3-configobj py3-pip py3-setuptools python3 python3-dev zip unzip wget ffmpeg
RUN wget https://github.com/LambdaExpression/JumpCutter2/archive/refs/heads/master.zip
RUN unzip -d /opt master.zip
RUN mv /opt/JumpCutter2-master /opt/JumpCutter2
RUN mkdir -p /opt/JumpCutter2/JumpCutter2/pretrained_models/5stems
RUN wget https://github.com/deezer/spleeter/releases/download/v1.4.0/5stems.tar.gz
RUN tar -zxvf 5stems.tar.gz -C /opt/JumpCutter2/JumpCutter2/pretrained_models/5stems


WORKDIR /opt/JumpCutter2
RUN rm -rf /root/tmp
RUN pip install .
RUN pip install -r requirements.txt
RUN python -m JumpCutter2 -h
