class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :google_id, default: ''

      t.timestamps
    end
  end
end
