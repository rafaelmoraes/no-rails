# frozen_string_literal: true

module InvoiceManager
  module Transactions
    module Invoices
      class RetrieveAllInvoices
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import['repos.invoice_repo']

        def call
          Success(invoice_repo.all)
        end
      end
    end
  end
end
