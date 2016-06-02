class BookMarkLabel < ActiveRecord::Base
  belongs_to :label
  belongs_to :book_mark
  belongs_to :user

 # before_destroy :delete_label

 # def delete_label
  #	self.label.delete
 # end
end
