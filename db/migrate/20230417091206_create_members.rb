class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.integer :counts, default: 0, null: false

      t.timestamps
    end
  end
end
