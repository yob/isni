require 'isni'
require 'rspec/core/rake_task'

desc "Default: run specs"
task :default => :spec

desc "Run all rspec files"
RSpec::Core::RakeTask.new("spec") do |t|
  t.rspec_opts  = ["--color", "--format progress"]
  t.ruby_opts = "-w"
end
