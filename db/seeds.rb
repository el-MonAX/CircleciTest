# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'ffaker'

# User.create!(name: 'Admin',
#              email: 'admin@bookstore.com',
#              password: 'admin123456A',
#              password_confirmation: 'admin123456A',
#              admin: true)
# 10.times do |n|
#   User.create!(name: FFaker::Name.name,
#                email: "bookstoreuser-#{n + 1}@bookstore.com",
#                password: 'test123456A',
#                password_confirmation: 'test123456A')
# end
#
user = User.last
users = User.all
#
# ['Mobile development', 'Photo', 'Web design', 'Web development'].each do |category|
#   Category.create(name: category)
# end
#
# categories = Category.all
#
# 20.times do
#   Author.create(first_name: FFaker::Name.first_name,
#                 last_name: FFaker::Name.last_name,
#                 description: FFaker::Lorem.paragraph)
# end
#
authors = Author.all

def book_authors(authors)
  selected_authors = []
  rand(1..3).times do
    author = authors.sample
    selected_authors << author unless selected_authors.include?(author)
  end
  selected_authors
end
#
# def book_categories(categories)
#   selected_categories = []
#   1.times do
#     category = categories.sample
#     selected_categories << category unless selected_categories.include?(category)
#   end
#   selected_categories
# end
#
# 50.times do
#   Book.create(title: FFaker::Book.title,
#               price: "#{rand(1..99)}.99",
#               quantity: rand(1...5),
#               description: FFaker::Book.description,
#               height: rand(7.5...10.0).floor(2),
#               width: rand(4.5...5.5).floor(2),
#               depth: rand(0.3...4.0).floor(2),
#               publication_year: rand(2001..2017),
#               materials: FFaker::Lorem.words.join(', '),
#               authors: book_authors(authors),
#               category_id: categories.sample.id,
#               # remote_cover_url: "https://s3.eu-central-1.amazonaws.com/el-monax-bookstore/cover/2.png"
#               )
# end
#
books = Book.all

books.each do |book|
  book_authors(authors).each do |author|
    BookAuthor.create!(author_id: author.id, book_id: book.id)
  end

  rand(1..4).times do
    Review.create!(title: FFaker::Lorem.words.join(', '),
                   text: FFaker::Lorem.sentences.join('. '),
                   rating: rand(1..5),
                   status: 'approved',
                   book_id: book.id,
                   user_id: user.id)
  end
end

Delivery.create(name: 'Happy Weekend', time: '1 to 3 days', price: 5.00)
Delivery.create(name: 'Happy day', time: '1 day', price: 50.00)

Coupon.create(code: 'Birthday', discount: 8.45)
Coupon.create(code: 'Present', discount: 25.45)
