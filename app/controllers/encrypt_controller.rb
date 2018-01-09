require 'openssl'
require 'base64'

class EncryptController < ApplicationController

	def encrypt_message
	    key = OpenSSL::PKey::RSA.new 2048
	    
	    created_key = Rsa.find(params[:id])
	    #work in progress
	end

end