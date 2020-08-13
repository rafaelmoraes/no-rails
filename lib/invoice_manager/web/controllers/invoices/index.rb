# frozen_string_literal: true

module InvoiceManager
  module Web
    module Controllers
      module Invoices
        class Index
          include Hanami::Action
          include Import['transactions.invoices.retrieve_all_invoices']

          def call(_params)
            result = retrieve_all_invoices.call
            invoices = result.value!.map(&:to_hash)

            self.body = invoices.to_json
            self.status = invoices.empty? ? 404 : 200
          end
        end
      end
    end
  end
end
