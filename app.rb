require 'open-uri'
require 'mime-types'
require 'sinatra'
require 'twilio-ruby'

GOOD_BOY = 'https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'

post '/whatsapp' do
  num_media = params['NumMedia'].to_i

  # Reply message
  response = Twilio::TwiML::MessagingResponse.new
  response.message do |message|
    if num_media == 0
      message.body 'Send us an image!'
    else
      message.body 'Thanks for the image! Here\'s one for you!'
      message.media GOOD_BOY
    end
  end

  content_type 'text/xml'
  response.to_s
end
