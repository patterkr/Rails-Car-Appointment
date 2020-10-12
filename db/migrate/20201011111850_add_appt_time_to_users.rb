class AddApptTimeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :appt_time, :string
  end
end
