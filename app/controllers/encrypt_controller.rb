require 'openssl'
require 'base64'

class EncryptController < ApplicationController

	def encrypt_message
	    key = OpenSSL::PKey::RSA.new 2048
	    
	    id = params[:id]
	    
	    key.n = Rsa.find(id).n.to_i
	    key.e = Rsa.find(id).e.to_i
	    key.d = Rsa.find(id).d.to_i

	    enc_message = key.private_encrypt(params[:message])
	    enc_message = Base64.encode64(enc_message)
	    created_msg = Encrypt2.create(:enc_message => enc_message)

	    render plain: created_msg.id
	end

	def show
	    id = params[:id2]
	    message = Encrypt2.find(id).enc_message
	    render json: {message:message}
	end
end