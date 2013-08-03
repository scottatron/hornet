$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hornet/core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hornet_core"
  s.version     = Hornet::Core::VERSION
  s.authors     = ["Scott Arthur"]
  s.email       = ["scott@scottatron.com"]
  s.homepage    = "http://github.com/scottatron"
  s.summary     = "Hornet::Core."
  s.description = "Hornet::Core."

  s.files       = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files  = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
end
