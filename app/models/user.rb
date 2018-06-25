# frozen_string_literal: true

# User
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:facebook]

  attr_accessor :skip_password_validation

  validates :email, presence: true,
                    format: { with: /@/, message: 'ivalid format' }

  validates :password,
            format: { with: /\A\S(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\S*\z/i },
                      # message: 'should contain at least 1 uppercase, at least \
                     # 1 lowercase, at least 1 number and not contain spaces.' },
            unless: :skip_password_validation

  has_many :orders, dependent: :destroy
  has_many :order_items, through: :orders, dependent: :destroy
  has_many :books, through: :order_items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :addresses, dependent: :destroy

  has_one :billing, dependent: :destroy
  has_one :shipping, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar = auth.info.image
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
