# docker-x2go-phpstorm
Usage:

docker-compse.yml

version: '2'
services:
  phpstorm:
    build:
      context: .
    image: vrgfa/x2go-phpstorm
    ports:
      - "2224:22"
    environment:
      - SSH_PASSWORD=phpstorm
    volumes:
      - /var/www/html:/var/www/html
