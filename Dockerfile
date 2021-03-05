FROM python:3.8.2

WORKDIR /opt/url_shortener_digital_pine

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libsasl2-dev \
    wait-for-it \
    && rm -rf /var/lib/apt/lists/*

# set python env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient

COPY . .
RUN chmod a+x entrypoint.sh


