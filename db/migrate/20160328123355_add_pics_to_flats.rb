class AddPicsToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :pics, :string, array: true
  end
end
