Rails.application.routes.draw do

post 'rsas' => 'rsa#create_new_key'
get 'rsas/:id' => 'rsa#show'

post 'rsas/:id/encrypt_messages' => 'encrypt#encrypt_message'
get 'rsas/:id/encrypt_messages/:id2' => 'encrypt#show'

post 'rsas/:id/decrypt_messages' => 'decrypt#decrypt_message'

end
