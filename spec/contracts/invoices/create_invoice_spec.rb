# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvoiceManager::Contracts::Invoices::CreateInvoice do
  context 'requires number' do
    it 'is invalid' do
      result = subject.call(number: nil)

      expect(result).to be_failure
      expect(result.errors[:number]).to include('must be filled')
    end
  end
end
