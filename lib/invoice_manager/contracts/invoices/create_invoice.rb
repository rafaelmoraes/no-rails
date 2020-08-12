# frozen_string_literal: true

module InvoiceManager
  module Contracts
    module Invoices
      class CreateInvoice < Dry::Validation::Contract
        params do
          required(:number).filled(:string)
        end
      end
    end
  end
end
