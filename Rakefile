require "bundler"
Bundler::GemHelper.install_tasks

require "rspec/core/rake_task"
require "spree/testing_support/common_rake"

RSpec::Core::RakeTask.new

task :default do
  if Dir["spec/dummy"].empty?
    Rake::Task[:test_app].invoke
    Dir.chdir("../../")
  end
  Rake::Task[:spec].invoke
end

desc "Generates a dummy app for testing"
namespace :spree_product_reviews do
  task :test_app, [:user_class] => :environment do |_t, args|
    Spree::DummyGeneratorHelper.inject_extension_requirements = true
    Rake::Task["common:test_app"].execute(args.with_defaults(install_admin: true, install_storefront: true))
  end
end

