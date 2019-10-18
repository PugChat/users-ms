class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :mail
      t.string :password
      t.string :username
      t.boolean :verification
      t.boolean :active

      t.timestamps
    end
  end
end
