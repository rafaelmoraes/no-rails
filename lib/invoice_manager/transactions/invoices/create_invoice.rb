# frozen_string_literal: true

module InvoiceManager
  module Transactions
    module Invoices
      class CreateInvoice
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Import['contracts.invoices.create_invoice']
        include Import['repos.invoice_repo']

        def call(input)
          values = yield validate(input)
          user = yield persist(values)

          Success(user)
        end

        def validate(params)
          create_invoice.call(params).to_monad
        end

        def persist(result)
          Success(invoice_repo.create(result.values))
        end
      end
    end
  end
end
