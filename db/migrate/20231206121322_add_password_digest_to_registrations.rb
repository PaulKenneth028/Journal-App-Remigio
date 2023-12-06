class AddPasswordDigestToRegistrations < ActiveRecord::Migration[7.1]
  def change
    add_column :registrations, :password_digest, :string
  end
end
