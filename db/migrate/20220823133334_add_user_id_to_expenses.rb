class AddUserIdToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :user_id, :int
  end
end
