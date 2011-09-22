require 'test/unit'
require 'fakeweb'
require 'flexmock/test_unit'

require File.expand_path('../../lib/rubygems/commands/versions_command', __FILE__)

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase
  include FlexMock::TestCase

  def stub_rubygems_api(gem_name)
    FakeWeb.register_uri :get,
                         "https://rubygems.org/api/v1/versions/#{gem_name}.json",
                         :response => fixture_file(gem_name)
  end

  def fixture_file(gem_name)
    File.read File.expand_path("../fixtures/#{gem_name}.json", __FILE__)
  end

  # Thanks https://github.com/jnunemaker/gemwhois/blob/master/test/helpers/output.rb
  def assert_output(expected, &block)
    keep_stdout do |stdout|
      block.call
      if expected.is_a?(Regexp)
        assert_match expected, stdout.string
      else
        assert_equal expected.to_s, stdout.string
      end
    end
  end

  def keep_stdout(&block)
    begin
      orig_stream, $stdout = $stdout, StringIO.new
      block.call($stdout)
    ensure
      s, $stdout = $stdout.string, orig_stream
      s
    end
  end

end
