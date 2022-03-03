require 'rspec/core/rake_task'
require "ci/reporter/rake/rspec"

RSpec::Core::RakeTask.new(:spec)

task :ci => ['ci:setup:rspec', 'spec']