# Couch Potato Docker Image for Raspberry Pi [![Build Status](https://travis-ci.org/nelsonyaccuzzi/docker-rpi-couchpotato.svg?branch=master)](https://travis-ci.org/nelsonyaccuzzi/docker-rpi-couchpotato)

## Usage

```
docker run -d \
  --name couchpotato \
  -v /path/to/config:/config \
  -v /path/to/data:/data \
  -p 5050:5050 \
  --restart unless-stopped \
  nelsonyaccuzzi/docker-rpi-couchpotato
```
