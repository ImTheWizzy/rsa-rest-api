RSpec.describe EncryptController do

    it "Should encrypt the message and return it's id" do
        key = OpenSSL::PKey::RSA.new 2048
        
        old_count = Encrypt2.count

        Rsa.create(:n => key.n, :e => key.e, :d => key.d)
        post :encrypt_message, params: {message: "Came in the game with a key", id: 1}

        expect(Encrypt2.count).to eq old_count + 1
        expect(response.body).to eq(Encrypt2.count)
    end

    it "Should show the encrypted message" do
        key = OpenSSL::PKey::RSA.new 2048
        
        Rsa.create(:n => key.n, :e => key.e, :d => key.d)
        
        post :encrypt_message, params: {message: "Came in the game with a key", id: 1}
        get :show, params: {id:1, id2:1}

        expect(response.body).not_to be_nil
    end

end