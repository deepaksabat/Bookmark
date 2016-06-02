class CreateBookMarkLabels < ActiveRecord::Migration
  def change
    create_table :book_mark_labels do |t|
      t.belongs_to :label, index: true, foreign_key: true
      t.belongs_to :book_mark, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
