# frozen_string_literal: true
require_relative 'api'

module Oblio
  class Invoice
    attr_accessor :cif, :client, :issue_date, :due_date, :delivery_date, :collect_date,
                  :series_name, :collect, :reference_document, :language, :precision,
                  :currency, :products, :issuer_name, :issuer_id, :notice_number,
                  :internal_note, :deputy_name, :deputy_identity_card, :deputy_auto,
                  :sales_agent, :mentions, :value, :work_station, :use_stock

    def initialize(cif: '', client: {}, issue_date: '', due_date: '', delivery_date: '',
                   collect_date: '', series_name: '', collect: [], reference_document: [],
                   language: 'RO', precision: 2, currency: 'RON', products: [], issuer_name: '',
                   issuer_id: '', notice_number: '', internal_note: '', deputy_name: '',
                   deputy_identity_card: '', deputy_auto: '', sales_agent: '', mentions: '',
                   value: 0, work_station: 'Sediu', use_stock: 0)
      @cif = cif
      @client = client
      @issue_date = issue_date
      @due_date = due_date
      @delivery_date = delivery_date
      @collect_date = collect_date
      @series_name = series_name
      @collect = collect
      @reference_document = reference_document
      @language = language
      @precision = precision
      @currency = currency
      @products = products
      @issuer_name = issuer_name
      @issuer_id = issuer_id
      @notice_number = notice_number
      @internal_note = internal_note
      @deputy_name = deputy_name
      @deputy_identity_card = deputy_identity_card
      @deputy_auto = deputy_auto
      @sales_agent = sales_agent
      @mentions = mentions
      @value = value
      @work_station = work_station
      @use_stock = use_stock
    end

    def to_h
      {
        'cif' => @cif,
        'client' => @client,
        'issueDate' => @issue_date,
        'dueDate' => @due_date,
        'deliveryDate' => @delivery_date,
        'collectDate' => @collect_date,
        'seriesName' => @series_name,
        'collect' => @collect,
        'referenceDocument' => @reference_document,
        'language' => @language,
        'precision' => @precision,
        'currency' => @currency,
        'products' => @products,
        'issuerName' => @issuer_name,
        'issuerId' => @issuer_id,
        'noticeNumber' => @notice_number,
        'internalNote' => @internal_note,
        'deputyName' => @deputy_name,
        'deputyIdentityCard' => @deputy_identity_card,
        'deputyAuto' => @deputy_auto,
        'salesAgent' => @sales_agent,
        'mentions' => @mentions,
        'value' => @value,
        'workStation' => @work_station,
        'useStock' => @use_stock
      }
    end

    def create(api)
      api.post('invoices', to_h)
    end
  end
end