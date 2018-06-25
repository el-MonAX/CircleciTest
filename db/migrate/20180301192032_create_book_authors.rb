# frozen_string_literal: true

#
class CreateBookAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :book_authors, id: false do |t|
      t.belongs_to :author, index: true
      t.belongs_to :book, index: true
    end
    add_index :book_authors, [:author_id, :book_id]
  end
end
