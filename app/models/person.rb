class Person < ApplicationRecord
  # Can use URI::MailTo::EMAIL_REGEXP for Ruby 2.2.1+
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  # Phone number should be from +xxxx to +xxxxxxxxxxxxxxx
  validates :phone, format: { with: /\A\+\d{4,15}\z/ }
end
