RSpec.describe RsaController do
    it "Should create a new key and return it's id" do
        i = 1
        while i < 5 do
            post :create_new_key
            expect(response.body).to eq(i.to_s) # testing if it generates id correctly
            i += 1
        end
    end

    it "Should show n, e and d of the key" do
        i = 1
        while i < 5 do
            post :create_new_key            
            get :show, params: {id:i.to_s}
            expect(JSON.parse(response.body)).to include("n", "e", "d") # testing to see if the json is correct
            i += 1
        end
    end

    it "Should work with user inputed n, e and d" do
        n = 4
        e = 7
        d = 9
        post :create_new_key, params: {n: n, e: e, d: d}
        get :show, params: {id:1}
        expect(JSON.parse(response.body)).to include("n" => n, "e" => e, "d" => d)
    end

end