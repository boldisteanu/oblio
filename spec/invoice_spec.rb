require 'webmock/rspec'
require_relative '../lib/oblio/invoice'
require_relative '../lib/oblio/api'

RSpec.describe Oblio::Invoice do
  let(:api_key) { ENV['OBLIO_API_KEY'] }
  let(:api) { Oblio::Api.new(api_key) }
  let(:invoice) do
    described_class.new(
      cif: '',
      client: {
        'cif' => '',
        'name' => '',
        'rc' => '',
        'code' => '',
        'address' => '',
        'state' => '',
        'city' => '',
        'country' => '',
        'iban' => '',
        'bank' => '',
        'email' => '',
        'phone' => '',
        'contact' => '',
        'vatPayer' => ''
      },
      issue_date: 'yyyy-mm-dd',
      due_date: '',
      delivery_date: '',
      collect_date: '',
      series_name: '',
      collect: [],
      reference_document: [],
      language: 'RO',
      precision: 2,
      currency: 'RON',
      products: [
        {
          'name' => 'Abonament',
          'code' => '',
          'description' => '',
          'price' => '100',
          'measuringUnit' => 'buc',
          'currency' => 'RON',
          'vatName' => 'Normala',
          'vatPercentage' => 19,
          'vatIncluded' => true,
          'quantity' => 2,
          'productType' => 'Serviciu'
        }
      ],
      issuer_name: '',
      issuer_id: '',
      notice_number: '',
      internal_note: '',
      deputy_name: '',
      deputy_identity_card: '',
      deputy_auto: '',
      sales_agent: '',
      mentions: '',
      value: 0,
      work_station: 'Sediu',
      use_stock: 0
    )
  end

  describe '#create' do
    it 'creates an invoice via the API' do
      stub_request(:post, "https://www.oblio.eu/api/invoices")
        .with(
          headers: {
            'Authorization' => "Bearer #{api_key}",
            'Content-Type' => 'application/json'
          },
          body: invoice.to_h.to_json
        )
        .to_return(status: 200, body: { 'success' => true }.to_json, headers: { 'Content-Type' => 'application/json' })

      response = invoice.create(api)
      expect(response).to eq('success' => true)
    end
  end
end