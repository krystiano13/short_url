class CreateUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :urls do |t|
      t.string :long
      t.string :short
      t.integer :user_id
      t.integer :visits

      t.timestamps
    end
  end
end
