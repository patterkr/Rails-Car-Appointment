class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :fname
      t.string :lname
      t.integer :phonenum
      t.integer :caryear
      t.string :carmake
      t.string :carmodel
      t.text :repairs
      t.string :appt
      t.string :ip

      t.timestamps
    end
  end
end
