class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :guest, index: true #au lieu de t.belongs_to
      t.belongs_to :listing
      t.timestamps
    end
  end
end
