class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :category
      t.float :cost
      t.date :date
    end
  end
end
