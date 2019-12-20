# frozen_string_literal: true

namespace :factory_bot do
  desc 'Verify that all FactoryBot factories are valid'
  task lint: :environment do
    abort 'run on test environment' unless Rails.env.test?
    begin
      # default db
      DatabaseCleaner[:active_record].strategy = :transaction
      DatabaseCleaner[:active_record].clean_with(:truncation)

      # Load prefectures seed to be able to do factory objects related to a prefecture
      Rake::Task['db:seed'].invoke

      DatabaseCleaner.start

      # mock_s3
      # require_relative Rails.root.join('spec', 'support', 'mock_s3.rb')
      FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
