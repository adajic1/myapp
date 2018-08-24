# /lib/tasks/documentation.rake
require 'rdoc/task'

namespace :doc do
  RDoc::Task.new("app") { |rdoc|
    rdoc.rdoc_dir = 'doc/app'
    rdoc.template = ENV['template'] if ENV['template']
    rdoc.title = ENV['title'] || 'Rails Application Documentation'
    rdoc.options << '--line-numbers'
    rdoc.options << '--charset' << 'utf-8'
    rdoc.rdoc_files.include('README.md')
    rdoc.rdoc_files.include('app/**/*.rb')
    rdoc.rdoc_files.include('lib/**/*.rb')
  }
  Rake::Task['doc:app'].comment = "Generate docs for the app -- also available doc:rails, doc:guides (options: TEMPLATE=/rdoc-template.rb, TITLE=\"Custom Title\")"
end
