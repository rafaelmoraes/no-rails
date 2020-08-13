# frozen_string_literal: true

require 'web_helper'

RSpec.describe 'invoices', 'Create' do
  context 'POST /' do
    context 'with valid input' do
      let(:input) { { number: '123' } }

      it 'succeeds' do
        post_json('/invoices', input)

        expect(last_response.status).to eq(200)

        invoice = parsed_body

        expect(invoice['id']).not_to be_nil
        expect(invoice['number']).to eq('123')
        expect(invoice['identity']).to match(/[0-9]+ 123/)
      end
    end
  end

  context 'with invalid input' do
    let(:input) { { number: nil } }

    it 'returns an error' do
      post_json('/invoices', input)

      expect(last_response.status).to eq(422)

      invoice = parsed_body

      expect(invoice['errors']['number']).to include('must be filled')
    end
  end
end
