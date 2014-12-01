class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.string :phone
      t.integer :rink_id

      t.timestamps
    end
  end
end
