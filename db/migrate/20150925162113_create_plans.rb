class CreatePlans < ActiveRecord::Migration
  def  change
    create_table :plans, force: :cascade do |t|
    t.string :name
    t.decimal :price
    
    t.timestamps
    end
  end
end
