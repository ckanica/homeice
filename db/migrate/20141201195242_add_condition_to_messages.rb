class AddConditionToMessages < ActiveRecord::Migration
  def change
      add_column :messages, :condition, :integer
  end
end
