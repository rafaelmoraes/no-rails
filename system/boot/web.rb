# frozen_string_literal: true

InvoiceManager::Application.boot(:web) do
  init do
    require 'hanami-router'
    require 'hanami-controller'
  end
end
