# CreateTickets model class
class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.references :departament, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
