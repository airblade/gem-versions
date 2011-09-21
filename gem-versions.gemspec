# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'gem-versions/version'

Gem::Specification.new do |s|
  s.name        = 'gem-versions'
  s.version     = '0.0.1'
  s.authors     = [ 'Andy Stewart' ]
  s.email       = 'boss@airbladesoftware.com'
  s.homepage    = ''
  s.summary     = 'List all published versions of a gem.'
  s.description = <<END
  The `gem versions` command can be used to show all versions of
  a gem published on Rubygems.org.
END

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  #s.require_paths = ["lib"]

  s.add_dependency 'httparty', '~> 0.8'
end