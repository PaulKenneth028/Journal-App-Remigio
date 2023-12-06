class AddUsernameToRegistrations < ActiveRecord::Migration[7.1]
  def change
    add_column :registrations, :username, :string
  end
end
