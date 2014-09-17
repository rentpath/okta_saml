$:.push File.expand_path("../lib", __FILE__)

require 'okta_saml/version'

Gem::Specification.new do |gem|
  gem.name          = "okta_saml"
  gem.version       = OktaSaml::VERSION
  gem.authors       = ["Jared Branum", "Ed Leung", "Michael Hoitomt", "Luke Fender"]
  gem.email         = ["jbranum@primedia.com", "eleung@primedia.com", "mhoitomt@primedia.com", "lfender@primedia.com"]
  gem.description   = %q{The okta_saml gem helps Ruby on Rails applications communicate with Okta}
  gem.summary       = %q{The okta_saml gem helps Ruby on Rails applications communicate with Okta}
  gem.homepage      = "https://github.com/primedia/okta_saml"

  gem.files         = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency "rails",     ">= 4.0"
  gem.add_dependency "ruby-saml", "~> 0.7.2"
  gem.add_development_dependency "rspec-rails"
end
