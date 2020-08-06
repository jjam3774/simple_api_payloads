class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :payload
      t.text :body

      t.timestamps
    end
  end
end
