source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.1.2'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'sprockets-rails'
gem 'sassc-rails'
gem 'pg', '~> 1.4', '>= 1.4.6'
gem 'puma', '~> 6.2', '>= 6.2.1'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false
gem 'kaminari'

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'rack-mini-profiler'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.3'
end

gem "tailwindcss-rails", "~> 2.0"
