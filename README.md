# Lab3-
ssh-keygen
docker build -t simpleweb -f Dockerfile .
docker tag simpleweb radzio2209/simpleweb
docker run -p 8080:8080 -d simpleweb
