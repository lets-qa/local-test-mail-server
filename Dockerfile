FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y postfix && \
    apt-get clean

# Configure Postfix to accept emails
COPY postfix/main.cf /etc/postfix/main.cf
COPY postfix/aliases /etc/aliases

EXPOSE 25

CMD ["postfix", "start-fg"]