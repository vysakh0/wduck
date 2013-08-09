# Ensure we require the local version and not one we might have installed already
$:.push File.expand_path("../lib", __FILE__)
require 'wduck/version'

spec = Gem::Specification.new do |s|
  s.name = 'wduck'
  s.version = Wduck::VERSION
  s.author = 'Vysakh Sreeenivasan'
  s.email = 'diplomatv@gmail.com'
  s.homepage = 'http://github.com/vysakh0/wduck'
  s.platform = Gem::Platform::RUBY
  s.description = 'A command line tool to get instant zero click result from ddg'
  s.summary = 'A command line tool for accessing zero click feature of Duck duck go'
  s.license = 'MIT'
# Add your other files here if you make them
  s.files = %w(
bin/wduck
lib/wduck/version.rb
lib/wduck.rb
lib/wduck/duck.rb
lib/wduck/duck_helper.rb
  )
  s.require_paths << 'lib'
  s.extra_rdoc_files = ['README.rdoc','wduck.rdoc']
  s.bindir = 'bin'
  s.executables << 'wduck'
  s.add_development_dependency('rake')
  s.add_development_dependency('httpclient')
  s.add_development_dependency('htmlentities')
  s.add_development_dependency('rainbow')
  s.add_runtime_dependency('gli','2.7.0')
  s.add_runtime_dependency('httpclient')
  s.add_runtime_dependency('htmlentities')
  s.add_runtime_dependency('rainbow')
end
