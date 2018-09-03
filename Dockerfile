FROM ubuntu:latest
MAINTAINER Yabo Li <liyabo@founder.com.cn>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python python-pip python-virtualenv gunicorn

# Setup flask application
RUN mkdir -p /app
COPY gunicorn_config.py /gunicorn_config.py
COPY app /app
RUN pip install -r /app/requirements.txt
WORKDIR /app

#EXPOSE 5000

# Start gunicorn
CMD ["/usr/bin/gunicorn", "--config", "/gunicorn_config.py", "main:app"]