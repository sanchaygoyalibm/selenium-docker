FROM docker.io/bellsoft/liberica-openjdk-alpine:17.0.12

#workspace
WORKDIR /home/selenium-docker

# Install curl and jq
RUN apk add curl jq

# Add the required files
ADD target/docker-resources         ./
ADD runner.sh                       runner.sh

# Start the runner.sh
ENTRYPOINT sh runner.sh