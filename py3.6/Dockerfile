FROM tiangolo/uwsgi-nginx:python3.6

MAINTAINER Christoffer Holmberg <christoffer.holmberg@ksfmedia.fi>

# Install less
RUN echo "deb http://httpredir.debian.org/debian stretch contrib" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y -qq node-less

# Install JDK
RUN  apt-get install -t jessie-backports -y -qq openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Copy app configuration to Nginx
COPY conf/nginx.conf /etc/nginx/conf.d/

# Copy app configuration to supervisor
COPY conf/supervisord.conf /etc/supervisor/conf.d/

# Upgrade pip
RUN pip install --upgrade pip

# Installing cython before, because needed to compile pyjnius in next step
RUN pip install cython==0.26.1
# Copy requirements to root and install
COPY requirements.txt /app
RUN pip install -r requirements.txt
