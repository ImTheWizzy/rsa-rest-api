require 'openssl'
require 'base64'

class DecryptController < ApplicationController

	def decrypt_message
		key = OpenSSL::PKey::RSA.new 2048

		id = params[:id]

		key.n = Rsa.find(id).n.to_i
		key.e = Rsa.find(id).e.to_i
		key.d = Rsa.find(id).d.to_i

		dec_message = Base64.decode64(params[:message])
		dec_message = key.public_decrypt(dec_message)
		created_msg = Decrypt.create(:dec_message => dec_message)
	end
end