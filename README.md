# OktaSaml

[Okta](http://www.okta.com) is an IDP (Identity Provider) that offers enterprise authentication solutions. Okta works by redirecting visitors to your application to a login page that is hosted by Okta. Upon successful authentication Okta sends a POST request with a SAML payload to a Post Back URL (configured by you at setup). The okta_saml gem helps Ruby on Rails applications communicate with Okta.

It is an engine that adds the following features to your application

1. A new helper: okta_authenticate!
2. Routes

    - /saml/init: Outbound to Okta
    - /saml/consume: Handles the Okta POST response

3. Session Management
    - The okta_saml gem will create a signed cookie that expires in 120 minutes

## Installation

Add this line to your application's Gemfile:

    gem 'okta_saml'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install okta_saml

## Okta Configuration
The following steps will help you integrate your Okta application with the okta_saml gem

1. When creating your application on Okta use the Template SAML 2.0 App
2. When specifying the Post Back URL use your hostname/saml/consume. For example http://www.yourdomain.com/saml/consume.  It is important that the Post Back URL is a publically accessible domain. For local development you can use a service such as forwardhq.com to make your localhost port publically accessible

## Configuration

1. The idp\_sso\_target\_url should be set to the Embed Link from Okta
2. The idp\_cert\_fingerprint needs to be created.

    a. Download the Public certificate from Okta. This can be found from within your application configuration, under the Sign On tab.

    b. Click on the "SAML 2.0 setup instructions for Template SAML 2.0 App".

    c. From that page download the Public certificate.

    d. Run the following command replacing the okta.cert file with the path/name of the downloaded certificate.

        openssl x509 -noout -fingerprint -in "okta.cert"

    e. Copy everything after the "SHA1 Fingerprint=" into the 'okta\_saml.yml' file as the idp_cert_fingerprint

## Usage

The following steps are required when using the okta_saml gem

1. Create an `okta_saml.yml` file in your application's config directory. A sample okta_saml.yml file has been included with this gem in the config directory with some configuration notes
2. Add a `before_filter` using okta_authenticate! in the controllers where authentication is required


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
