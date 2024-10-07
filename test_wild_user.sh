#!/bin/bash

# Define the SMTP server and port
SMTP_SERVER="localhost"
SMTP_PORT=25

# Define the email details
FROM_EMAIL="automation@local.ingest.lets.qa"
TO_EMAIL="anything@local.ingest.lets.qa"
SUBJECT="Test Email"
BODY="This is a test email sent via telnet."

# Use telnet to connect to the SMTP server and simulate an SMTP transaction
(
echo "open $SMTP_SERVER $SMTP_PORT"
sleep 2
echo "HELO $SMTP_SERVER"
sleep 2
echo "MAIL FROM:<$FROM_EMAIL>"
sleep 2
echo "RCPT TO:<$TO_EMAIL>"
sleep 2
echo "DATA"
sleep 2
echo "Subject: $SUBJECT"
echo "$BODY"
echo "."
sleep 2
echo "QUIT"
) | telnet
