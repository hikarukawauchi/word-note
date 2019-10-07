class AddDescriptionToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :description, :string
  end
end
