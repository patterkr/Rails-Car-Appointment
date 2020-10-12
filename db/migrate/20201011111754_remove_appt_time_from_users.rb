class RemoveApptTimeFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :appt_time, :datetime
  end
end
