class AddUserToBookMark < ActiveRecord::Migration
  def change
    add_reference :book_marks, :user, index: true, foreign_key: true
  end
end
