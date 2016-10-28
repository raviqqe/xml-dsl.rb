Gem::Specification.new do |s|
  s.name        = 'xml-dsl'
  s.version     = '0.0.2'
  s.date        = Date.today.to_s
  s.license     = 'Unlicense'

  s.summary     = 'XML DSL'
  s.description = 'XML DSL and generator'

  s.authors     = ['Yota Toyama']
  s.email       = 'raviqqe@gmail.com'
  s.homepage    = 'https://github.com/raviqqe/xml-dsl.rb'

  s.add_dependency 'block-is-array', '~> 0'

  s.files       = Dir['lib/**/*']
end
