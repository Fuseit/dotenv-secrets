require 'vault'

module Dotenv
  module Secrets
    module Services
      class Vault
        attr_accessor :name, :client

        def initialize name, client
          @name = name
          @client = client
        end

        def list secrets={}, path=''
          client.kv(name).list(path).each do |item|
            key = path + item

            if item[-1] == '/'
              list(secrets, key)
            else
              secrets[key] = client.kv(name).read(key)
            end
          end

          secrets
        end

        private

        def list_by_path_depth
          # Sorts on two conditions:
          #  - Highest path count first
          #  - Alpabetical
          list.sort_by {|i| [i[0].split('/').count, i[0]]}
              .to_h
        end
      end
    end
  end
end
