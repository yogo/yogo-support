require 'rake'
begin
  require 'bundler/setup'
  Bundler.require(:default)
  Bundler::GemHelper.install_tasks
rescue LoadError
  puts "Bundler is not intalled. Install with: gem install bundler"
end

if RUBY_VERSION[0..2] == "1.9"
  Bundler::GemHelper.class_eval do
    def sh_with_code(cmd, &block)
      outbuf, errbuf = '', ''
      pid = nil
      Dir.chdir(base) {
        stdin, stdout, stderr, waitth = *Open3.popen3(cmd)
        pid = waitth.value
        outbuf, errbuf = stdout.read, stderr.read
        block.call(outbuf, errbuf) if block
      }
      [outbuf, errbuf, pid]
    end
  end
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  desc 'Run all examples using rcov'
  RSpec::Core::RakeTask.new(:rcov) do |spec|
    spec.rcov = true
    spec.rcov_opts =  %[-Ilib -Ispec --exclude "mocks,expectations,gems/*,spec/resources,spec/lib,spec/spec_helper.rb,db/*,/Library/Ruby/*,config/*"]
    spec.rcov_opts << %[--no-html --aggregate coverage.data]
  end
rescue LoadError
  puts "RSpec not installed. Install with: bundle install"
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
