class CreateClinks < ActiveRecord::Migration[5.1]
  def change
    create_table :clinks do |t|
      t.text :clink

      t.timestamps
    end
  end
end
