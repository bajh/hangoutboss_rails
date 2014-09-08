class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :screenname, :string
    add_column :users, :slug, :string
    add_index :users, :slug
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
  end
end