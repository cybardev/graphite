FROM alpine:3.22 as main
WORKDIR /app

ADD https://github.com/GraphiteEditor/Graphite/releases/download/latest-stable/graphite-self-hosted-build.zip /app/
RUN unzip graphite-self-hosted-build.zip -d /app/
RUN mv graphite*/* /app/

ADD https://github.com/m3ng9i/ran/releases/latest/download/ran_linux_amd64.zip /tmp/
RUN unzip /tmp/ran_linux_amd64.zip -d /bin/
RUN mv /bin/ran_linux_amd64 /bin/ran

EXPOSE 8080
CMD [ "ran", "-nc" ]