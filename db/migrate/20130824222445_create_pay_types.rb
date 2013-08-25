class CreatePayTypes < ActiveRecord::Migration
  def change
    create_table :pay_types do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :pay_types, :name, unique: true
  end
end
