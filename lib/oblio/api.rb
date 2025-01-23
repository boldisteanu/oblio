# frozen_string_literal: true
require 'net/http'
require 'json'

module Oblio
  class Api
    BASE_URL = 'https://www.oblio.eu/api'

    def initialize(api_key = ENV['OBLIO_API_KEY'])
      @api_key = api_key
    end

    def get(endpoint, params = {})
      uri = URI("#{BASE_URL}/#{endpoint}")
      uri.query = URI.encode_www_form(params)
      request = Net::HTTP::Get.new(uri)
      request['Authorization'] = "Bearer #{@api_key}"

      # Logging for debugging
      puts "Request URI: #{uri}"
      puts "Request Headers: #{request.to_hash}"

      send_request(request)
    end

    def post(endpoint, body = {})
      uri = URI("#{BASE_URL}/#{endpoint}")
      request = Net::HTTP::Post.new(uri)
      request['Authorization'] = "Bearer #{@api_key}"
      request['Content-Type'] = 'application/json'
      request.body = body.to_json
      send_request(request)
    end

    def put(endpoint, body = {})
      uri = URI("#{BASE_URL}/#{endpoint}")
      request = Net::HTTP::Put.new(uri)
      request['Authorization'] = "Bearer #{@api_key}"
      request['Content-Type'] = 'application/json'
      request.body = body.to_json
      send_request(request)
    end

    def delete(endpoint, params = {})
      uri = URI("#{BASE_URL}/#{endpoint}")
      uri.query = URI.encode_www_form(params)
      request = Net::HTTP::Delete.new(uri)
      request['Authorization'] = "Bearer #{@api_key}"
      send_request(request)
    end

    private

    def send_request(request)
      response = Net::HTTP.start(request.uri.hostname, request.uri.port, use_ssl: true) do |http|
        http.request(request)
      end
      JSON.parse(response.body)
    rescue JSON::ParserError
      { error: 'Invalid JSON response' }
    end
  end
end