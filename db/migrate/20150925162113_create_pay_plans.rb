class CreatePayPlans < ActiveRecord::Migration
  def change
    create_table :pay_plans do |t|
      t.string :name
      t.decimal :price
      t.timestamps
    end
  end
end
