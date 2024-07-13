require 'net/http'
require 'json'
require_relative '../lib/oblio/api'

RSpec.describe Oblio::Api do
  let(:api_key) { ENV['OBLIO_API_KEY'] }
  let(:api) { described_class.new(api_key) }

  describe '#post' do
    it 'sends a POST request and returns the response' do
      stub_request(:post, "https://www.oblio.eu/api/invoices")
        .with(
          headers: {
            'Authorization' => "Bearer #{api_key}",
            'Content-Type' => 'application/json'
          },
          body: { 'test' => 'data' }.to_json
        )
        .to_return(status: 200, body: { 'success' => true }.to_json, headers: { 'Content-Type' => 'application/json' })

      response = api.post('invoices', { 'test' => 'data' })
      expect(response).to eq('success' => true)
    end
  end
end
