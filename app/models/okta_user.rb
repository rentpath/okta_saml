class OktaUser
  attr_accessor :email, :attributes, :issuer

  def initialize(params)
    populate(params)
  end

  def populate(params)
    params.each do |k, v|
      self.send("#{k}=".to_sym, v)
    end
  rescue NoMethodError => error
    p error
  end

  def self.retrieve_from_cookie(remember_token)
    self.new(:email => remember_token) unless remember_token.blank?
  end

end
