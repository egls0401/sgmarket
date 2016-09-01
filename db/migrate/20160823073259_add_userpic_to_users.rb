class AddUserpicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :userpic, :string, default: "happy"
  end
end
