FROM alpine:latest

RUN apk add --no-cache curl wget grep

RUN curl -s https://api.github.com/repos/allenai/beaker/releases/latest \
      | grep 'browser_download_url.*linux' \
      | cut -d '"' -f 4 \
      | wget -qi - \
    && tar -xvzf beaker_linux.tar.gz -C "/usr/bin/"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
