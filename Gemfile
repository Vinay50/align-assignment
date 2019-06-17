source 'https://rubygems.org'

ruby '2.5.0'

# Enforce git to transmitted via https.
# workaround until bundler 2.0 is released.
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.3' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'sqlite3' # Use sqlite3 as the database for Active Record
gem 'puma', '~> 3.11' # Use Puma as the app server
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'bootsnap', '>= 1.1.0', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'bootstrap' # Use for adding css and js
gem 'devise' # Flexible authentication solution for Rails with Warden
gem 'jquery-rails' # Add juery
gem 'simple_form' # Rails forms made easy.

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "capybara", "~> 3.13" # Capybara is an integration testing tool for rack based web applications
  gem "faker", "~> 1.9" # A library for generating fake data such as names, addresses, and phone numbers
  gem "parallel_tests", "~> 2.28" # Run Test::Unit / RSpec / Cucumber / Spinach in parallel
  gem "pry-byebug", "~> 3.7" # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue' and 'break' commands to control execution
  gem "rspec-rails", "~> 3.8" # rspec-rails is a testing framework for Rails 3+
  gem "rubocop", "~> 0.67", require: false # Automatic Ruby code style checking tool
  gem "rubocop-performance", "~> 1.0", require: false # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem "rubocop-rspec", "~> 1.32", require: false # Code style checking for RSpec files
end

group :development do
  gem 'web-console', '>= 3.3.0' # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'selenium-webdriver'
  gem 'chromedriver-helper' # Easy installation and use of chromedriver to run system tests with Chrome
  gem "factory_bot_rails", "~> 4.11" # factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies
  gem "launchy", "~> 2.4" # Launchy is helper class for launching cross-platform applications in a fire and forget manner.
  gem "pundit-matchers", "~> 1.6" # A set of RSpec matchers for testing Pundit authorisation policies
  gem "rspec-retry", "~> 0.6" # retry intermittently failing rspec examples
  gem "ruby-prof", "~> 0.17", require: false # ruby-prof is a fast code profiler for Ruby
  gem "shoulda-matchers", "4.0.1", require: false # Simple one-liner tests for common Rails functionality
  gem "simplecov", "~> 0.16", require: false # Code coverage with a powerful configuration library and automatic merging of coverage across test suites
  gem "stackprof", "~> 0.2", require: false, platforms: :ruby # stackprof is a fast sampling profiler for ruby code, with cpu, wallclock and object allocation samplers
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

