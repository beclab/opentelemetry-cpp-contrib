# TO BE COMPLETED
docker buildx build --rm -t apache_ubuntu -f docker/ubuntu20.04/Dockerfile .

docker run -idt --rm --name apache_ubuntu_container apache_ubuntu /bin/bash

docker cp apache_ubuntu_container://otel-webserver-module/build/opentelemetry-webserver-sdk-aarch64-linux.tgz .

docker build --rm -t bytetrade/autoinstrumentation-apache-httpd:1.0.4-arm64 -f Dockerfile.apache_httpd .

docker push bytetrade/autoinstrumentation-apache-httpd:1.0.4-amd64
docker push bytetrade/autoinstrumentation-apache-httpd:1.0.4-arm64
docker manifest create bytetrade/autoinstrumentation-apache-httpd:1.0.4-fix --amend  bytetrade/autoinstrumentation-apache-httpd:1.0.4-fix-arm64 --amend  bytetrade/autoinstrumentation-apache-httpd:1.0.4-fix-amd64
docker manifest push bytetrade/autoinstrumentation-apache-httpd:1.0.4-fix