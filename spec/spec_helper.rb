require 'bundler'
Bundler.require :all
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.default_cassette_options = { match_requests_on: [:method, :host] }
end
require_relative '../lib/heroku-status'
