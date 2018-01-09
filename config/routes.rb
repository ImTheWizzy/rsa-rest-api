Rails.application.routes.draw do

post 'rsas' => 'rsa#create_new_key'
get 'rsas/:id' => 'rsa#show'

end
