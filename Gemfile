source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7.1'
# Use SCSS for stylesheets

gem 'sass-rails', '~> 5.0'
gem 'compass-rails', '~> 4.0'

gem 'jquery-rails'
# gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'sprockets-rails', '3.2.1'
# gem 'font-awesome-sass'
# gem "font-awesome-rails"
gem 'popper_js', '~> 1.16.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
#gem 'bootsnap', '>= 1.1.0', require: false
#gem 'bootsnap', '~> 1.7', '>= 1.7.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
  gem 'guard-rspec', require: false

  gem 'pry-rails'
  gem 'minitest-rails'
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'minitest-rails-capybara'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-minitest'
  gem 'timecop'
  gem 'ffaker'
  #gem 'factory_girl_rails'
  gem "factory_bot"
  gem 'rspec_api_documentation'
  gem 'shoulda-matchers'
  gem 'table_print', '~> 1.5', '>= 1.5.6'

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem "rubycritic", require: false
  gem 'annotate'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'database_cleaner'
  gem 'dox', require: false
end

group :production do
  gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
  gem 'puma', '~> 3.7.1'#3.7.1
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]





gem 'sdoc', '~> 0.4.0', group: :doc 
gem 'imgkit', '~> 1.6.1'  
gem 'wkhtmltoimage-binary', '~> 0.12.2'
#gem 'aws-sdk', '~> 2.3.0'
#gem "aws-sdk-s3", require: false
gem 'aws-sdk', '~> 3'

gem 'httparty'
gem 'newrelic_rpm'
gem 'charlock_holmes'
gem 'bitly', '~> 0.10.4'
#sidekiq use redis as a job management store to process thousands of jobs per second. 
gem 'sidekiq', '~> 6.2', '>= 6.2.1' #gestionnaire de tâche de fond/background job framework
gem 'sinatra', :require => false #for sidekiq
gem 'sidekiq-scheduler', '~> 3.0', '>= 3.0.1' # planificateur de tâche pr Sidekiq
gem 'simple_form'
gem 'stripe'
gem "paperclip", "~> 5.0.0"
gem 'devise'
gem 'devise-bootstrap-views', '~> 1.0'
git_source(:github){ |repo_name| "https://github.com/#{repo_name}.git" }
gem 'remotipart', github: 'jbox-web/remotipart', tag: '1.6.0'
gem 'gon'
gem 'mailjet'
gem 'roda', "~> 2.29.0"
gem 'jquery-fileupload-rails'
#gem 'bootstrap-sass'
gem 'hirb'
gem 'rack-cors', :require => 'rack/cors'
gem 'rollbar' # reporting des erreurs
gem "bootstrap-switch-rails", '3.3.3'
gem 'htmlentities' # permet de transformer les accents en entités HTML ex: &eacute;
gem 'htmlcompressor' # permet de compresser le HTML  des widgets
gem 'will_paginate-bootstrap' # pagination
gem 'google_url_shortener'
gem 'google-cloud-vision', '~> 0.31.0'
#gem 's3_direct_upload'
gem 'slim'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'money-rails'
gem 'open_uri_redirections'
gem 'kaminari'
gem 'geocoder'
gem 'enumerize'
gem 'rebrandly'
gem 'doorkeeper', '~> 4.2.6'
gem 'active_model_serializers', '~> 0.10.7'
gem 'blueprinter'
gem 'oj'




