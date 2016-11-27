$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "route_bound/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "route_bound"
  s.version     = RouteBound::VERSION
  s.authors     = ["Jason Charnes"]
  s.email       = ["jason@thecharnes.com"]
  s.homepage    = "https://github.com/jasoncharnes/route_bound"
  s.summary     = "Implicit model binding for Ruby on Rails."
  s.description = "Implicit model binding for Ruby on Rails, based on Laravel's implicit model binding."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mocha"
end
