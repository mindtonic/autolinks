$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'ffaker'
require 'autolinks'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  config.mock_with :rspec
end

#
# Constants for Testing
#

module Autolinks
  TEST_STRING = "@thishandle #communicates with @thisotherhandle ...
  This is a test string with some #hashtags and other types of #marked #content....
  winning! We're #1! email@email.com. We're also going to test some URL's: http://google.com,
  or http://google.com/, or google.com, or http://google.co.uk, or google.co.uk"
end