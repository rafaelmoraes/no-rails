# frozen_string_literal: true

InvoiceManager::Application.boot(:persistence) do |app|
  start do
    config = app['db.config']

    # autoloads the relations
    config.auto_registration("#{app.root}/lib/invoice_manager")

    register('container', ROM.container(app['db.config']))
  end
end
