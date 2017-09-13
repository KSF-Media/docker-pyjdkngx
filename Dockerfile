FROM tiangolo/uwsgi-nginx:python3.5

MAINTAINER Christoffer Holmberg <christoffer.holmberg@ksfmedia.fi>

# Install node less
RUN echo "deb http://httpredir.debian.org/debian jessie contrib" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y -qq npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g less

# Install JDK
RUN  apt-get install -y -qq openjdk-7-jdk 
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements to root and install
COPY requirements.txt /
RUN grep -v "^#" /requirements.txt | xargs -n 1 pip install

# Copy app configuration to Nginx
COPY conf/nginx.conf /etc/nginx/conf.d/

# Copy app configuration to supervisor
COPY conf/supervisord.conf /etc/supervisor/conf.d/