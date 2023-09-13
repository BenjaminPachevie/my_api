class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :start_date
      t.integer :end_date
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
