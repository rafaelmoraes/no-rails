# frozen_string_literal: true

require_relative 'config/application'

InvoiceManager::Application.finalize!

run InvoiceManager::Web.app
