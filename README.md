# When creating our Elastic Beanstalk environment in the next lecture, we need to select Docker running on 64bit Amazon Linux 2 and make a few changes to our project:


This new AWS platform will conflict with the project we have built since it will look for a docker.compose.yml file to build from by default instead of a Dockerfile.

There are one of two ways to resolve this.

#1 - Rename the Compose config file:

Rename the docker-compose.yml file to docker-compose-dev.yml. Going forward you will need to pass a flag to specify which compose file you want to build and run from:
docker-compose -f docker-compose-dev.yml up
docker-compose -f docker-compose-dev.yml up --build
docker-compose -f docker-compose-dev.yml down

No other changes will be necessary. Since a docker-compose.yml file does not exist, AWS EBS will instead build the Dockerfile as shown in the lecture videos.

#2 - Create a production only Compose config file:

Rename the docker-compose.yml file to docker-compose-dev.yml. Going forward you will need to pass a flag to specify which compose file you want to build and run from:
docker-compose -f docker-compose-dev.yml up
docker-compose -f docker-compose-dev.yml up --build
docker-compose -f docker-compose-dev.yml down

Then, create a new docker-compose.yml file in the root of the project and paste the following:

version: '3'
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - '80:80'
AWS EBS will see a file named docker-compose.yml and use it to build the single container application.