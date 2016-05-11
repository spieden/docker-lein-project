FROM java:8

RUN apt-get clean && apt-get update && apt-get install ed

ARG LEIN_ROOT=ok
RUN mkdir /proj/
RUN curl https://raw.githubusercontent.com/technomancy/leiningen/2.6.0/bin/lein > /bin/lein
COPY add_cd.ed /
RUN ed /bin/lein < /add_cd.ed
RUN chmod 755 /bin/lein
RUN lein

