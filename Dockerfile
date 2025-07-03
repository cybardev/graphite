FROM alpine:3.22 AS main
WORKDIR /app
RUN apk add --no-cache unzip curl

# download and extract Graphite
RUN curl -L -o graphite.zip https://github.com/GraphiteEditor/Graphite/releases/download/latest-stable/graphite-self-hosted-build.zip && \
    unzip graphite.zip -d /tmp/graphite && \
    mv /tmp/graphite/*/* /app/ && \
    rm -rf /tmp/graphite graphite.zip

# download and install ran
RUN curl -L -o /tmp/ran.zip https://github.com/m3ng9i/ran/releases/latest/download/ran_linux_amd64.zip && \
    unzip /tmp/ran.zip -d /bin/ && \
    mv /bin/ran_linux_amd64 /bin/ran && \
    chmod +x /bin/ran && \
    rm /tmp/ran.zip

EXPOSE 8080
CMD [ "ran", "-nc" ]