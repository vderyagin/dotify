# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper.rb"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
$:.unshift File.expand_path("../../lib", __FILE__)

if ENV["COVERAGE"] == 'true'
  require 'simplecov'
  SimpleCov.start 'test_frameworks'
end

require 'dotify'
require 'ostruct'
load './spec/support/vcr.rb'

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.run_all_when_everything_filtered = true
  c.filter_run :focus
  c.extend VCR::RSpec::Macros

  c.before(:each) do
    Thor::Util.stub(:user_home) { '/tmp/home' }
  end
end

Dir["./spec/support/**/*.rb"].each { |f| require f }
