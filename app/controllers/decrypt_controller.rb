require 'openssl'
require 'base64'

class DecryptController < ApplicationController

	def decrypt_message
		key = OpenSSL::PKey::RSA.new 2048
		#work in progress
	end
end