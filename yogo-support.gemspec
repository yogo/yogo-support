Gem::Specification.new do |gem|
  gem.authors       = ["Ryan Heimbuch" ]
  gem.email         = [ "yogo@msu.montana.edu" ]
  gem.description   = "Supporting code for the Yogo Data Management Framework components."
  gem.summary       = "Supporting code for the Yogo Data Management Framework components."
  gem.homepage      = "http://yogo.msu.montana.edu"
  gem.date          = "2011-12-20"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.rdoc]

  gem.name          = "yogo-support"
  gem.require_paths = [ "lib" ]
  
  gem.version       = "0.2.1"
end


