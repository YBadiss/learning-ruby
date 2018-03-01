class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.primary_key :email, :string

      t.timestamps
    end
  end
end
