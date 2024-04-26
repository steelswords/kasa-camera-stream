FROM alpine

ENV LANG C.UTF-8

# Copy data for add-on
COPY run.sh /
COPY Controller /Controller
RUN chmod a+x /run.sh

# Install dependencies
RUN apk add --no-cache \
    bash \
    ffmpeg \
    nginx \
    nginx-mod-rtmp \
    python3 \
    py-pip \
    pipx

# Install python dependencies
#RUN pipx install an

# Nginx setup
COPY nginx/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /run/nginx
RUN mkdir -p /tmp/streaming/thumbnails
RUN mkdir /tmp/streaming/hls

CMD [ "/run.sh" ]
#CMD ["python3", "/Controller/Controller.py"]
#CMD ["tail", "-f", "/dev/null"]
