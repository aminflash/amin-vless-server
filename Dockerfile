FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y wget tar

# دانلود و استخراج صحیح
RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.8.0/sing-box-1.8.0-linux-amd64.tar.gz \
    && tar -xvzf sing-box-1.8.0-linux-amd64.tar.gz \
    && chmod +x sing-box-1.8.0-linux-amd64/sing-box \
    && mv sing-box-1.8.0-linux-amd64/sing-box /usr/local/bin/sing-box \
    && rm -rf sing-box-1.8.0-linux-amd64*

COPY config.json /etc/sing-box/config.json

CMD ["sing-box", "run", "-c", "/etc/sing-box/config.json"]
