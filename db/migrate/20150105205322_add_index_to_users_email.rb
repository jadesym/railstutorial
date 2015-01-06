class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	# Adds an index on the email column  of the users table
  	# index itself does not enforce uniqueness, but the option "unique:true" does
  	add_index :users, :email, unique: true
  end
end
