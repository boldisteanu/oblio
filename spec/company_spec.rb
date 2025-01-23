require 'webmock/rspec'
require_relative '../lib/oblio/company'
require_relative '../lib/oblio/api'

RSpec.describe Oblio::Company do
  let(:api_key) { 'test_api_key' }
  let(:api) { Oblio::Api.new(api_key) }

  describe '.list' do
    it 'lists companies via the API' do
      stub_request(:get, "https://api.oblio.eu/nomenclature/companies")
        .with(
          headers: {
            'Authorization' => "Bearer #{api_key}",
            'Content-Type' => 'application/json'
          }
        )
        .to_return(status: 200, body: [{ 'name' => 'Test Company' }].to_json, headers: { 'Content-Type' => 'application/json' })

      response = described_class.list(api)
      expect(response).to eq([{ 'name' => 'Test Company' }])
    end
  end
end
