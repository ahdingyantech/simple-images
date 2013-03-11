# coding: utf-8
Gem::Specification.new do |s|
  s.name          = 'simple-images'
  s.version       = '0.0.2'
  s.platform      = Gem::Platform::RUBY
  s.date          = '2013-03-11'
  s.summary       = 'simple images for rails 3'
  s.description   = 'To add some helper methods for create images in web page.'
  s.authors       = 'ben7th'
  s.email         = 'ben7th@sina.com'
  s.homepage      = 'https://github.com/mindpin/simple-images'
  s.licenses      = 'MIT'

  s.files         = Dir.glob("lib/**/*") + %w(README.md)
  s.require_paths = ['lib']
  
end