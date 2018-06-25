# frozen_string_literal: true

#
class Author < ApplicationRecord
  has_many :book_author, dependent: :destroy
  has_many :books, through: :book_author, dependent: :destroy

  validates :first_name, presence: true
  validates :first_name, :last_name, length: {
    maximum: 30,
    wrong_length: 'Invalid length',
    too_long: '%{count} characters is the maximum allowed'
  }
end
