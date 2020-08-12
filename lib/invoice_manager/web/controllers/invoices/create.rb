# frozen_string_literal: true

module InvoiceManager
  module Web
    module Controllers
      module Invoices
        class Create
          include Hanami::Action
          include Import['transactions.invoices.create_invoice']
          include Dry::Monads[:result]

          def call(params)
            case create_invoice.call(params.to_hash)
            in Success(result)
              self.body = result.to_hash.to_json
              self.status = 200
            in Failure(result)
              self.body = { errors: result.errors.to_hash }.to_json
              self.status = 422
            end
          end
        end
      end
    end
  end
end
