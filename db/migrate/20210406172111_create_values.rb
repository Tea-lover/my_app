class CreateValues < ActiveRecord::Migration[6.1]
  def change
    create_table :values do |t|
      t.integer :user_id
      t.integer :image_id
      t.float :value

      t.timestamps
    end
  end
end
