# overture-docker

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`.

| Architecture |         Tag         |
| :----------: | :-----------------: |
|    x86-64    |  \${version}-amd64  |
|    arm64     | \${version}-arm64v8 |
|    armhf     | \${version}-arm32v7 |

## Usage

### docker-compose

```yaml
version: "3"

services:
  overture:
    image: hades001/overture-docker:latest
    container_name: overture
    volumes:
      - "data:/etc/overture"
    networks:
      - net
    ports:
      - "53:53/tcp"
      - "53:53/udp"
    restart: unless-stopped

volumes:
  data:

networks:
  net:
    driver: bridge
```
