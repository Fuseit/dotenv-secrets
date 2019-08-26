require 'English'

module Dotenv
  module Substitutions
    # Substitute secret as a value.
    #
    #   PASSWORD=vault://secret/path#key:version
    #
    module Secret
      class << self
        SECRET = /((?<vault>.+)(:\/\/))+(?<path>.+)+(#(?<secret>\w+))+(:(?<version>.+))?/i

        def call(value, _env, _is_load)
          # Don't substitute the value if the vault name doesn't match
          # a configured service
          #
          # Init a service client based on the vault name.
          #   aws:// for an AWS secret store
          #          anything else is a Vault store
          'blah'
        end

        private

        def service vault_name

        end

        def service_secrets

        end

        def configured_services

        end
      end
    end
  end
end
