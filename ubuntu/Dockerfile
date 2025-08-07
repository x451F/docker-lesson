FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install mc
RUN apt-get -y install lynx
RUN touch welcome.txt
RUN echo "Welcome to the Docker container!" > welcome.txt
RUN echo "This container has mc and lynx installed." >> welcome.txt
RUN echo "You can access the welcome message by running: cat welcome.txt" >> welcome.txt