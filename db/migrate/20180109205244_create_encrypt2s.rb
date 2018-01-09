class CreateEncrypt2s < ActiveRecord::Migration[5.1]
  def change
    create_table :encrypt2s do |t|
      t.string :enc_message
      t.integer :id_of_key

      t.timestamps
    end
  end
end
