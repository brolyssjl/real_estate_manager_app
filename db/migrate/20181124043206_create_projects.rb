class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :country
      t.string :city
      t.string :neighborhood
      t.string :address
      t.string :phone_number
      t.text :description
      t.string :logo
      t.integer :stratum
      t.boolean :activated
      t.string :sales_room_address
      t.string :sales_room_phone
      t.string :sales_room_email
      t.date :estimated_start_date
      t.date :estimated_end_date

      t.timestamps
    end
  end
end
