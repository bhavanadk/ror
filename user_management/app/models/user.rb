class User < ActiveRecord::Base
	attr_accessor :password
	before_save :encrypt_password
	 validates :firstname,:presence=>true
  validates  :lastname,:presence=>true            
	validates :email, :presence => true,:uniqueness => {:case_sensitive => false},format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Not a valid email Address" }
	validates_uniqueness_of :firstname, :email
  validates_length_of :password, :minimum => 8, :allow_blank => true

  PASSWORD_FORMAT = /\A
(?=.{8,})          # Must contain 8 or more characters
(?=.*\d)           # Must contain a digit
(?=.*[a-z])        # Must contain a lower case character
(?=.*[A-Z])        # Must contain an upper case character
(?=.*[[:^alnum:]]) # Must contain a symbol
/x

validates :password, 
presence: true, 
# length: {in: Devise.password_length }, 
format: {with: PASSWORD_FORMAT}, 
confirmation: true, 
on: :create

validates :password, 
allow_nil: true, 
# length: {in: Devise.password_length }, 
format: {with: PASSWORD_FORMAT}, 
confirmation: true, 
on: :update

	def encrypt_password
		if true
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
			end
		end	
 
end