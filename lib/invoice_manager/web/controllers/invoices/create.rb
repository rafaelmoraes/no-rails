# frozen_string_literal: true

module InvoiceManager
  module Web
    module Controllers
      module Invoices
        class Create
          include Hanami::Action
          include Dry::Monads[:result]

          include Import['transactions.invoices.create_invoice']

          def call(params)
            case create_invoice.call(params.to_hash)
            in Success(invoice)
              self.body = invoice.to_json
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
