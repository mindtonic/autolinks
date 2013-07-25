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

  TEST_URLS = [
    "http://foo.com/blah_blah",
    "http://foo.com/blah_blah/",
    "http://www.extinguishedscholar.com/wpglob/?p=364.",
    "http://6303E4C1-6A6E-45A6-AB9D-3A908F59AE0E.org",
    "http://www.quillandquire.com/blog/index.php/bookselling-2/2012/11/12/qa-the-monkeys-paw-introduces-the-biblio-mat-book-vending-machine/",
    "http://google.co.uk",
    "http://foo.com/blah_(wikipedia)_blah#cite-1",
    "http://mw1.google.com/mw-earth-vectordb/kml-samples/gp/seattle/gigapxl/$[level]/r$[y]_c$[x].jpg"
  ]
end