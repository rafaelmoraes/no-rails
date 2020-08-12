# frozen_string_literal: true

module InvoiceManager
  class Invoice < ROM::Struct
    def identity
      "#{id} #{number}"
    end
  end
end
