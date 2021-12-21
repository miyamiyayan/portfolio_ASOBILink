class RemovePostalCodeFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :postal_code, :string
  end
end
