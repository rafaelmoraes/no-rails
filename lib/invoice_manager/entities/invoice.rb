# frozen_string_literal: true

module InvoiceManager
  module Entities
    class Invoice < ROM::Struct
      def identity
        "#{id} #{number}"
      end

      def to_hash
        {
          id: id,
          number: number,
          identity: identity
        }
      end

      def to_json
        to_hash.to_json
      end
    end
  end
end
