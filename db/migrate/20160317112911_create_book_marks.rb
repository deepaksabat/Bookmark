class CreateBookMarks < ActiveRecord::Migration
  def change
    create_table :book_marks do |t|
      t.string :name
      t.string :url
      t.string :note

      t.timestamps null: false
    end
  end
end
