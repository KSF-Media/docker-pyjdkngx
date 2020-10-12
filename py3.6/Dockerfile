FROM tiangolo/uwsgi-nginx:python3.6

MAINTAINER Christoffer Holmberg <christoffer.holmberg@ksfmedia.fi>

# Install less
RUN echo "deb http://httpredir.debian.org/debian stretch contrib" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y -qq node-less

# Upgrade pip
RUN pip install --upgrade pip

# Installing cython before, because needed to compile pyjnius in next step
# Copy requirements to root and install
COPY requirements.txt /app
RUN pip install -r requirements.txt

# Copy app configuration to supervisor
COPY conf/supervisord.conf /etc/supervisor/conf.d/
