class CreateUnavailabilities < ActiveRecord::Migration
  def change
    create_table :unavailabilities do |t|
      t.references :flat, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
