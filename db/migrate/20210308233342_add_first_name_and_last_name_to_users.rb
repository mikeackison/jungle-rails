class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration
  def change
    remove_column(:users, :name, if_exits: true)
    add_column(:users, :first_name, :string)
    add_column(:users, :last_name, :string)
  end
end
