$:.push File.expand_path("../lib", __FILE__)

require 'okta_saml/version'

Gem::Specification.new do |gem|
  gem.name          = "okta_saml"
  gem.version       = OktaSaml::VERSION
  gem.authors       = ["Michael Hoitomt", "Jared Branum", "Ed Leung", "Luke Fender"]
  gem.email         = ["mhoitomt@primedia.com", "jbranum@primedia.com", "eleung@primedia.com", "lfender@primedia.com"]
  gem.description   = %q{The okta_saml gem helps Ruby on Rails applications communicate with Okta}
  gem.summary       = %q{The okta_saml gem helps Ruby on Rails applications communicate with Okta. The gem properly
                        contstructs the request to Okta and handles the response back from Okta.}
  gem.homepage      = "https://github.com/primedia/okta_saml"

  gem.files         = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency "rails",     ">= 4.0"
  gem.add_dependency "ruby-saml", "~> 0.7.2"
  gem.add_development_dependency "rspec-rails"
end
