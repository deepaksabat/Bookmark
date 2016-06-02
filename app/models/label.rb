class Label < ActiveRecord::Base
	attr_accessor :user
	has_many :book_mark_labels, :dependent => :destroy
	has_many :book_marks, through: :book_mark_labels
    belongs_to :user


    def self.labled(name)
    	find(name).book_marks
   	end
end
