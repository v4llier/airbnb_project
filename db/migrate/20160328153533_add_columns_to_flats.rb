class AddColumnsToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :title, :string
    add_column :flats, :description, :text
  end
end
