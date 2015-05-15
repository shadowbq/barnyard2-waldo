$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
name = "barnyard2waldo"
require "#{name}/version"


Gem::Specification.new do |gem|
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ["shadowbq"]
  gem.email         = ["shadowbq@gmail.com"]
  gem.description   = %q{Describe the waldo bookmark for barnyard2}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/shadowbq/barnyard2-waldo"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "barnyard2waldo"
  gem.require_paths = ["lib"]
  gem.version       = Barnyard2::Waldo::VERSION
  gem.license       = 'MIT'

  gem.add_development_dependency('bump', '~> 0.3')
  gem.add_development_dependency('minitest')
  gem.add_development_dependency('ansi', '~> 1.5')
  gem.add_development_dependency('simplecov', '0.9.2')
end
