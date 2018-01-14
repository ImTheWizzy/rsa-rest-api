RSpec.describe DecryptController do
   
    it "Should decrypt the message and return the id of a newly created one" do 
        key = OpenSSL::PKey::RSA.new 2048

        old_count = Decrypt.count

        Rsa.create(:n => key.n, :e => key.e, :d => key.d)

        message_to_encrypt = key.private_encrypt("Came in the game with a key")
        message_to_encrypt = Base64.encode64(message_to_encrypt)

        post :decrypt_message, params: {message: message_to_encrypt, id:1}
        
        expect(Decrypt.count).to eq old_count + 1
    end
    
end