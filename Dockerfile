
FROM python:3.8-slim
RUN apt update && apt install -y postgresql gcc python3 musl \
    freetype2-demos \
    libfribidi-dev \ 
    libharfbuzz-dev \
    libjpeg-dev \
    liblcms2-dev \
    libopenjp2-7-dev \
    tcl-dev \
    libtiff-dev \
    tk-dev \
    zlib1g
RUN apt install -y libffi-dev gcc make libevent-dev build-essential
# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# add requirements (to leverage Docker cache)
COPY ./requirements.txt /usr/src/app/requirements.txt

# install requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# add app
COPY . /usr/src/app
