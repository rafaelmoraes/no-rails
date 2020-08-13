# frozen_string_literal: true

require 'web_helper'

RSpec.describe 'invoices', 'Index' do
  context 'GET /' do
    context 'when there are invoices' do
      before do
        creator = InvoiceManager::Transactions::Invoices::CreateInvoice.new
        creator.call(number: '0000')
        creator.call(number: '1111')
      end

      it 'succeeds' do
        get_json('/invoices')

        expect(last_response.status).to eq(200)

        invoices = parsed_body
        invoice = invoices.first

        expect(invoice['id']).not_to be_nil
        expect(invoice['number']).to eq('0000')
        expect(invoice['identity']).to match(/[0-9]+ 0000/)
      end
    end
  end

  context 'when there are no invoices' do
    it 'returns an empty array' do
      get_json('/invoices')

      expect(last_response.status).to eq(404)

      invoice = parsed_body
      expect(invoice.size).to eq(0)
    end
  end
end
