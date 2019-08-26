require 'hash'

require 'dotenv'
require 'dotenv/substitutions/secret'

require 'dotenv/secrets/configuration'
require 'dotenv/secrets/services/vault'

require 'dotenv/secrets/parser'
require 'dotenv/secrets/version'

module Dotenv
  module Secrets
    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Dotenv::Secrets::Configuration.new

      yield(configuration)
    end
  end
end
