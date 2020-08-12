# frozen_string_literal: true

module InvoiceManager
  module Repos
    class InvoiceRepo < ROM::Repository[:invoices]
      include Import['container']

      struct_namespace InvoiceManager

      commands :create,
               use: :timestamps,
               plugins_options: {
                 timestamps: {
                   timestamps: %i[created_at updated_at]
                 }
               }

      def all
        invoices.to_a
      end
    end
  end
end
