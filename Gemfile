source 'http://rubygems.org'

ruby '2.1.1'

gem 'airbrake'
gem 'bourbon'
gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'email_validator'
gem 'flutie'
gem 'high_voltage'
gem 'jquery-rails'
gem 'neat'
gem 'pg'
gem 'rack-timeout'
gem 'rails', '>= 4.1.0'
gem 'recipient_interceptor'

# removing this due to problems with monkey patching in sass-rails
# it is comfort enough to use pure sass without sprockets trickery
#gem 'sass-rails'
gem 'sass'

gem 'simple_form'
gem 'title'
gem 'uglifier'

# Unicorn is very good and robust, but somehow I like puma in development
#gem 'unicorn'
gem 'puma'

group :development do
  gem 'foreman'
  # Spring is quite a buggy, I prefer zeus
  #gem 'spring'
  #gem 'spring-commands-rspec'
  gem 'zeus'
end

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.7.3'
  gem 'unicorn'
end
