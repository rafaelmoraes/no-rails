# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvoiceManager::Transactions::Invoices::RetrieveAllInvoices do
  let(:invoice_repo) { double('InvoiceRepo') }
  let(:invoices) { [InvoiceManager::Entities::Invoice.new(id: 1, number: '0000')] }

  subject { described_class.new(invoice_repo: invoice_repo) }

  it 'retrieve all invoices' do
    expect(invoice_repo).to receive(:all) { invoices }

    result = subject.call

    expect(result).to be_success
    expect(result.success).to eq(invoices)
  end
end
