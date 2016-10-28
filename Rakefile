require 'rake/clean'



TMP_DIR = 'tmp'


task :build do
  sh %q(gem build *.gemspec)
end

task :push => :build do
  sh %q(gem push *.gem)
end

task :install => :build do
  sh %q(gem install *.gem)
end

task :test => :install do
  sh 'tool/run_readme.sh README.md'

  Dir.glob('examples/*.rb').each do |file|
    test_xml = 'test.xml'
    File.write test_xml, `ruby #{file}`
    sh "xmllint --noout #{test_xml}"
    rm test_xml
  end
end

task :default => :build


CLEAN.include Dir.glob ['*.gem']
