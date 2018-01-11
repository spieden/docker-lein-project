FROM openjdk:9.0.1-11-jdk-slim

RUN apt-get clean && apt-get update && apt-get install -y ed curl

ARG LEIN_ROOT=ok
RUN mkdir /proj/
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/2.8.1/bin/lein > /bin/lein
COPY add_cd.ed /
RUN ed /bin/lein < /add_cd.ed
RUN chmod 755 /bin/lein
RUN lein

