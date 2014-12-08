class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	before_save { self.email = email.downcase }
	# Validates username is present, and is no longer than 50 charicters
	validates :name,  presence: true, length: { maximum: 50 }
	#valitdates user email is present, is no longer than 255 charicters, and also uses an regx.
	
	validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },
	 					                    uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, length: { minimum: 6 }
end
