# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvoiceManager::Repos::InvoiceRepo do
  describe '#create' do
    it 'creates a invoice' do
      invoice = subject.create(number: '000')

      expect(invoice).to be_an(InvoiceManager::Entities::Invoice)
      expect(invoice.id).not_to be_nil
      expect(invoice.number).to eq('000')
      expect(invoice.created_at).not_to be_nil
      expect(invoice.updated_at).not_to be_nil
    end
  end

  describe '#all' do
    before { subject.create(number: '000') }

    it 'returns all invoices' do
      invoices = subject.all
      expect(invoices.count).to eq(1)
      expect(invoices).to include(a_kind_of(InvoiceManager::Entities::Invoice))
    end
  end
end
