class CreateSouts < ActiveRecord::Migration
  def change
    create_table :souts do |t|
      t.string :item_name, 		null:false
      t.string :borrowed_by,		null:false
      t.datetime :date_borrowed,	null:false
      t.datetime :date_to_be_returned
      t.datetime :date_returned

      t.timestamps null: false
    end
  end
end
