
# Local Mail Server for Testing

Welcome to our Local Mail Server solution, designed specifically for testing mail reception in development environments. This tool is ideal for scenarios where your application needs to send emails but you prefer not to or are unable to use your ISP to send mail through the public internet.

## Purpose
Often during development, you may need to test email functionalities without the complications of setting up and using external mail services. This local mail server allows you to configure your application to route emails internally, simplifying the testing process by avoiding external dependencies and potential delays.

## Use Case
Whether you're developing new features, debugging, or conducting integration tests, this server simulates email sending and receiving capabilities within your local environment. It's a perfect fit for developers who need a straightforward, reliable method for email testing without impacting real-world email accounts or risking privacy.

## Quick Start
Set up is simple:
1. Configure your application’s SMTP settings to point to this local server.
2. Begin sending emails from your application.
3. Monitor and manage mails received by the server as needed for your testing scenarios.

## Example Telnet Transaction

To test the mail server manually, you can use Telnet to simulate sending an email. Here’s a step-by-step example:

```bash
telnet localhost 25
HELO local.test
MAIL FROM:<automation@local.ingest.lets.qa>
RCPT TO:<automation@local.ingest.lets.qa>
DATA
Subject: Test Email

This is a test email sent via Telnet.
.
QUIT
```
This sequence initiates a connection to the mail server, sends an email from `automation@local.ingest.lets.qa` to `automation@local.ingest.lets.qa`, and then closes the connection.

By using this local mail server, you ensure that all mail traffic remains contained within your development environment, providing a secure and controlled testing framework.


To Run:

 docker build . -t local-test-mail-server
 
 docker run -p 25:25 -v ~/mail:/var/mail -t local-test-mail-server



