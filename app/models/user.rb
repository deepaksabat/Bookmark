class User < ActiveRecord::Base
	attr_accessor :label
	 has_secure_password
	 has_many :book_marks
	 #has_many :book_mark_labels
	 has_many :labels
	 
end
