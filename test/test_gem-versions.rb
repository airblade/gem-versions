require 'test_helper'

class TestGemVersions < Test::Unit::TestCase

  def test_found_gem
    gem_name = 'thinking-sphinx'
    stub_rubygems_api gem_name
    command = Gem::Commands::VersionsCommand.new
    command = flexmock(command, :local_versions => %w[ 1.3.16 1.4.0 2.0.1 2.0.4 ])
    command.handle_options [gem_name]

    expected = <<END
  2.0.7
  2.0.6
  2.0.5
* 2.0.4
  2.0.3
  2.0.2
* 2.0.1
  2.0.0
  2.0.0.rc2
  2.0.0.rc1
  1.4.7
  1.4.6
  1.4.5
  1.4.4
  1.4.3
  1.4.2
  1.4.1
* 1.4.0
  1.3.20
  1.3.19
  1.3.18
  1.3.17
* 1.3.16
  1.3.15
  1.3.14
  1.3.13
  1.3.12
  1.3.11
  1.3.10
  1.3.9
  1.3.8
  1.3.7
  1.3.6
  1.3.4
  1.3.3
  1.3.2
  1.3.1
  1.3.0
  1.2.13
  1.2.12
END
    assert_output(expected) { command.execute }
  end

  def test_not_found_gem
    gem_name = 'thinking-sphinxx'
    stub_rubygems_api gem_name
    command = Gem::Commands::VersionsCommand.new
    command.handle_options [gem_name]

    assert_output("Unable to find thinking-sphinxx.\n") { command.execute }
  end

end
