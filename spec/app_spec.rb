ENV['APP_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require 'cgi'

require_relative '../app'

RSpec.describe 'whatsapp webhook tests' do

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'test post without images' do
    post '/whatsapp'

    expect(last_response).to be_ok
    expect(last_response.body).to include('<Body>Send us an image!</Body>')
  end

  it 'test post with an image' do
    allow(OpenURI).to receive(:open_uri).and_yield(StringIO.new('file content'))
    allow(File).to receive(:write).and_yield(true)

    post '/whatsapp' , params={:NumMedia => 1, :MediaUrl0 => 'http://sample.org/file', :MediaContentType0 => 'text/plain'}

    expect(last_response).to be_ok
    expect(last_response.body).to include('<Body>Thanks for the image! Here\'s one for you!</Body>')
    expect(last_response.body).to include("<Media>#{CGI.escapeHTML(GOOD_BOY)}</Media>")
  end

end
