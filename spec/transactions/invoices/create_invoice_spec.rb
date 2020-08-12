# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvoiceManager::Transactions::Invoices::CreateInvoice do
  let(:invoice_repo) { double('InvoiceRepo') }
  let(:invoice) { InvoiceManager::Invoice.new(id: 1, number: '0000') }

  subject { described_class.new(invoice_repo: invoice_repo) }

  context 'with valid input' do
    it 'creates an invoice' do
      expect(invoice_repo).to receive(:create) { invoice }

      result = subject.call(number: '000')

      expect(result).to be_success
      expect(result.success).to eq(invoice)
    end
  end

  context 'with invalid input' do
    it 'does not create an invoice' do
      expect(invoice_repo).to_not receive(:create)
      result = subject.call(number: 0)
      expect(result).to be_failure
      expect(result.failure.errors[:number]).to include('must be a string')
    end
  end
end
