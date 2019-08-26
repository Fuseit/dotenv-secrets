module Dotenv
  module Secrets
    class Configuration
      attr_accessor :secrets

      def initialize
        @secrets = {}
      end
    end
  end
end
