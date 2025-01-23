# frozen_string_literal: true
require 'net/http'
require 'json'
require_relative 'oblio/version'
require_relative 'oblio/api'
require_relative 'oblio/invoice'
require_relative 'oblio/company'

module Oblio
  class Error < StandardError; end

end