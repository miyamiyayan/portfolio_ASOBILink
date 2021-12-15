class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|

      t.integer :member_id,    null: false, default: ""
      t.integer :game_id,      null: false, default: ""


      t.timestamps
    end
  end
end
