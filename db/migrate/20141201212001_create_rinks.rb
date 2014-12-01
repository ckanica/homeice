class CreateRinks < ActiveRecord::Migration
  def change
    create_table :rinks do |t|
      t.string :name
      t.string :address
      t.string :rink_type
      t.integer :ottawa_rinks_ref

      t.timestamps
    end
  end
end
