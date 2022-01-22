class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|

      t.integer :member_id,      null: false
      t.string :title,           null: false, default: ""
      t.string :address,         null: false, default: ""
      t.float :latitude,         null: false, default: ""
      t.float :longitude,        null: false, default: ""

      t.string :number,          null: false, default: ""
      t.string :image_id,        null: false, default: ""

      t.timestamps
    end
  end
end
