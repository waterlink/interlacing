class AddFieldsToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :table, :string
    add_column :reservations, :start_at, :datetime
    add_column :reservations, :end_at, :datetime
  end
end
