require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://ruby.taobao.org'

gem 'rails', '~> 4.1.8'
#gem 'mysql2'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails'#,   '~> 4.0'
gem 'coffee-rails'#, '~> 4.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', require: false #, '~> 2.1', require: false

gem 'jquery-rails'
gem "omniauth"#, ">= 1.1.0"
gem "omniauth-github"
gem "bootstrap-sass", ">= 2.3.2", "< 3.0"
gem "coderay"
gem "kaminari"
gem "redcarpet"

# File Uploading
gem 'carrierwave'

# Comment Tree Structure
gem 'ancestry'
gem 'gravatar_image_tag'

group :development, :test do
  gem "rspec-rails", "~> 2.14.2", "< 2.99"
  gem "factory_girl_rails", ">= 3.3.0"
  gem "shoulda-matchers"
  gem "rspec-instafail"
  gem "capybara"
end

group :development do
  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.2'
  gem 'capistrano-rails', '~> 1.1'

  gem 'quiet_assets'
  gem "byebug"
  gem "guard", ">= 0.6.2"
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rspec", ">= 0.4.3"

  #case HOST_OS
  #  when /darwin/i
  #   gem 'rb-fsevent'
  #   gem 'growl'
  #  when /linux/i
  #    gem 'libnotify'
  #    gem 'rb-inotify'
  #  when /mswin|windows/
  #    gem 'rb-fchange'
  #    gem 'win32console'
  #    gem 'rb-notifu'
  # end
  gem "annotate", '~> 2.6.5'
  gem "rails_best_practices"
end

group :api do
  gem 'rack-oauth2'
  gem 'doorkeeper'
  gem 'grape'
  gem 'grape-entity'
end

group :test do
  gem "email_spec", ">= 1.2.1"
  gem 'simplecov', :require => false
end

gem 'hitimes'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem for Rails 4.1.0
gem 'tzinfo-data', platforms: [:mingw, :mswin]

