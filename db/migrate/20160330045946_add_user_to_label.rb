class AddUserToLabel < ActiveRecord::Migration
  def change
    add_reference :labels, :user, index: true, foreign_key: true
  end
end
