class CreateDecrypts < ActiveRecord::Migration[5.1]
  def change
    create_table :decrypts do |t|
      t.string :dec_message
      t.integer :id_of_key

      t.timestamps
    end
  end
end
