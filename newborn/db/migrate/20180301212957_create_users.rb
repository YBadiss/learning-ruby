class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.primary_key :name, :string
      t.string :password_digest
      t.string :salt

      t.timestamps
    end
  end
end
