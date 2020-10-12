class AddFormToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :year, :integer
    add_column :users, :make, :string
    add_column :users, :model, :string
    add_column :users, :repair, :string
    add_column :users, :appt_time, :datetime
  end
end
