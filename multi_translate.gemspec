Gem::Specification.new do |s|
  s.name = 'multi_translate'
  s.version = '0.1'
  s.authors     = ['Roberto Romero']
  s.email       = 'sildurin@gmail.com'
  s.homepage    = 'https://github.com/sildur/multi_translate'
  s.date        = '2014-02-12'
  s.summary     = 'A multi-engine language translating library'
  s.description = 'A library which allows to translate a text between two languages and using multiple translation engines'
  s.files = ['LICENSE', 'lib/multi_translate.rb', 'lib/multi_translate/engines.rb', 'lib/multi_translate/language_pairs.rb', 'lib/multi_translate/languages.rb']
  s.license       = 'MIT'
  s.add_runtime_dependency 'nokogiri', '>= 1.6.1'
  s.require_paths = ['lib']
end
