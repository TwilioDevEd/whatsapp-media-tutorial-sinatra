require 'open-uri'
require 'mime-types'
require 'sinatra'
require 'twilio-ruby'

GOOD_BOY = 'https://images.unsplash.com/photo-1518717758536-85ae29035b6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80'

post '/whatsapp' do
  num_media = params['NumMedia'].to_i

  if num_media > 0
    for i in 0..(num_media - 1) do
      # Prepare the file information
      media_url = params["MediaUrl#{i}"]
      content_type = params["MediaContentType#{i}"]
      file_name = media_url.split('/').last
      file_extension = MIME::Types[content_type].first.extensions.first
      file = "storage/#{file_name}.#{file_extension}"

      # Dowload the files
      open(media_url) do |url|
        File.open(file, 'wb') do |f|
          f.write(url.read)
        end
      end

    end
  end

  # Reply message
  response = Twilio::TwiML::MessagingResponse.new
  response.message do |message|
    if num_media == 0
      message.body 'Send us an image!'
    else
      message.body 'Thanks for the image(s).'
    end
    message.media GOOD_BOY
  end

  content_type 'text/xml'
  response.to_s
end
