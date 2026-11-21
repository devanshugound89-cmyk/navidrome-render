FROM alpine:3.22

RUN apk add --no-cache curl unzip ca-certificates \
    && curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip \
    && unzip rclone-current-linux-amd64.zip \
    && cp rclone-*-linux-amd64/rclone /usr/local/bin/ \
    && rm -rf rclone*

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 10000
CMD ["/start.sh"]
