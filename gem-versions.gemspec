# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'gem-versions'
  s.version     = '1.0.1'
  s.authors     = [ 'Andy Stewart' ]
  s.email       = 'boss@airbladesoftware.com'
  s.homepage    = 'https://github.com/airblade/gem-versions'
  s.summary     = 'List all published versions of a gem.'
  s.description = <<END
  The `gem versions` command can be used to show all versions of
  a gem published on Rubygems.org.  Versions you have installed
  locally are asterisked.
END

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path  = 'lib'

  s.add_dependency             'httparty', '~> 0.8'
  s.add_development_dependency 'rake',     '0.8.7'
  s.add_development_dependency 'fakeweb',  '~> 1.3'
  s.add_development_dependency 'flexmock', '~> 0.9'
end
