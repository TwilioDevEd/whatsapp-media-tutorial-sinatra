<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Receive, Download, and Reply with media in WhatsApp Messages. Powered by Twilio - Ruby

Use Twilio to receive WhatsApp media messages. For a step-by-step tutorial see
the [Twilio docs](https://www.twilio.com/docs/sms/tutorials/send-and-receive-media-messages-whatsapp-php).

## Local development
This project is built using the [Sinatra](http://sinatrarb.com/) web framework.

1. First clone this repository and `cd` into it

   ```bash
   $ git clone git@github.com:TwilioDevEd/whatsapp-media-tutorial-ruby.git
   $ cd whatsapp-media-tutorial-ruby
   ```

1. Install the dependencies

   ```bash
   $ bundle install
   ```

1. Run the server

   ```bash
   $ ruby app.rb
   ```

1. Expose your application to the wider internet using
   [ngrok](http://ngrok.com/). This step is important because the
   application won't work as expected if you run it through localhost.

   ```bash
   ngrok http -host-header=localhost 4567
   ```
   
   **Note:** You can read
   [this blog post](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html)
   for more details on how to use ngrok.

1. Configure Twilio's Sandbox for WhatsApp to call your webhook URL

   You will need to configure your [Twilio Sandbox for WhatsApp](https://www.twilio.com/console/sms/whatsapp/sandbox) 
   to call your application (exposed via ngrok) when your Sandbox number receives an incoming message. Your URL will 
   look something like this:

   ```
   http://6b5f6b6d.ngrok.io/whatsapp/
   ```

   Here are detailed instructions for [Twilio Sandbox for WhatsApp](https://www.twilio.com/docs/sms/whatsapp/api#twilio-sandbox-for-whatsapp)

## How to Demo

1. Send a message with a media attachment to your WhatsApp Sandbox phone number

1. Your Ruby application should display the incoming request from Twilio. In a few moments, you should get back a 
WhatsApp reply featuring a "good boy."

## Run the Tests

```bash
rspec
```

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
