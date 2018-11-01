class User < ApplicationRecord

	has_secure_password
	has_secure_token :confirmation_token

	validates_presence_of :username, 
	format:{with:/\A[a-zA-Z0-9]\z/,message:'ne doit contenir que des caractère alphanumérique'},
	uniqueness:  {case_sensitive:false}

	validates_presence_of :email, 
	format:{with:/\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/},
	uniqueness: {case_sensitive:false}

end
