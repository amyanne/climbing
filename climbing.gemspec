lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "climbing/version"

Gem::Specification.new do |spec|
  spec.name          = "climbing"
  spec.version       = Climbing::VERSION
  spec.authors       = ["Amy Westcott"]
  spec.email         = ["amy.westcott@yahoo.com"]

  spec.summary       = %q{This application tells you about climbing route location, grade and name.}
  spec.description   = %q{This application allows you to search through the top 100 climbing routes in the U.S. It can return a route based grade, location, or name.}
  spec.license       = "MIT"

  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency 'rspec', '~>3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'nokogiri'
end
