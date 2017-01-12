class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.text :bio
      t.string :location
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
