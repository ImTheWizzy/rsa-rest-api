require 'openssl'
	
class RsaController < ApplicationController

	def create_new_key
		key = OpenSSL::PKey::RSA.new 2048

		if params[:n] && params[:e] && params[:d]
			created_key = Rsa.create(:n => params[:n].to_i, :e => params[:e].to_i, :d => params[:d].to_i)
			render plain: created_key.id
		else
			created_key = Rsa.create(:n => key.n, :e => key.e, :d => key.d)
			render plain: created_key.id
		end
	end

	def show
		key = Rsa.find(params[:id])
		render plain: "'"'{"n":' + '"' + key.n.to_s + '", ' + '"e":' + '"' + key.e.to_s + '", ' + '"d":' + '"' + key.d.to_s + '"}'"'"
	end
end
