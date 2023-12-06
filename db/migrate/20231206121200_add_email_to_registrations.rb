class AddEmailToRegistrations < ActiveRecord::Migration[7.1]
  def change
    add_column :registrations, :email, :string
  end
end
