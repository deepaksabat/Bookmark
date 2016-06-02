class BookMark < ActiveRecord::Base
acts_as_xlsx
 attr_accessor :label
	has_many :book_mark_labels, :dependent => :destroy
	has_many :labels, through: :book_mark_labels
  belongs_to :user

 


  def self.search(search)
  where("name LIKE ?", "%#{search}%")
  end



  def self.delete(labels)
      labels.each do |label|
   if label.book_marks.count == 1
     label.destroy
   end
  end
end

#def as_xls(options = {})
  #{
     # "Name" => name,
     # "Location" => url,
    #  "Label" => label,
   #   "Notes" => note,
  #    "Relesed" => created_at
 # }
#end
      

 
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |book_mark|
        csv << book_mark.attributes.values_at(*column_names)
      end
    end
  end
end