class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :photo
      t.integer :flat_id, index: true


      t.timestamps null: false
    end
  end
end
