$:.push File.expand_path("../lib", __FILE__)

require 'okta_saml/version'

Gem::Specification.new do |gem|
  gem.name          = "okta_saml"
  gem.version       = OktaSaml::VERSION
  gem.authors       = ["Michael Hoitomt", "Jared Branum", "Ed Leung", "Luke Fender", "Thomas Stankus", "Jeb Beich", "Eric Caspary", "Phong Si", "Eric Toulson", "Jordi Noguera"]
  gem.email         = ["mhoitomt@rentpath.com", "jbranum@primedia.com", "eleung@primedia.com", "lfender@primedia.com", "tstankus@rentpath.com", "jbeich@rentpath.com", "ecaspary@rentpath.com", "phong.si@gmail.com", "etoulson@rentpath.com"]
  gem.description   = %q{The okta_saml gem helps Ruby on Rails applications communicate with Okta}
  gem.summary       = %q{The okta_saml gem helps Ruby on Rails applications communicate with Okta. The gem properly
                        contstructs the request to Okta and handles the response back from Okta.}
  gem.homepage      = "https://github.com/primedia/okta_saml"

  gem.files         = Dir["{app,config,db,lib}/**/*"] + ["CONTRIBUTORS", "LICENSE", "Rakefile", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency "rails",     ">= 3.2.13"
  gem.add_dependency "ruby-saml", "~> 0.7.2"
  gem.add_development_dependency "rspec-rails"
end
