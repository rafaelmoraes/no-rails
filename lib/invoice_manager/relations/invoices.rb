# frozen_string_literal: true

module InvoiceManager
  module Relations
    class Invoices < ROM::Relation[:sql]
      schema(:invoices, infer: true)
    end
  end
end
