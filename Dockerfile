# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install Postfix
RUN apt-get update && \
    apt-get install -y postfix && \
    apt-get clean

# Configure Postfix to run in the foreground
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections && \
    echo "postfix postfix/mailname string 'localhost'" | debconf-set-selections && \
    postconf -e 'inet_interfaces = all' && \
    postconf -e 'mydestination = localhost, local.ingest.lets.qa' && \
    postconf -e "virtual_alias_domains =" && \
    postconf -e "virtual_alias_maps = regexp:/etc/postfix/virtual_alias_maps"

RUN echo "/.*/    root" > /etc/postfix/virtual_alias_maps
RUN postmap /etc/postfix/virtual_alias_maps

# Expose the SMTP port
EXPOSE 25

# Declare a volume for the mail directory
VOLUME ["/var/mail"]

# Start Postfix
CMD ["postfix", "start-fg"]
