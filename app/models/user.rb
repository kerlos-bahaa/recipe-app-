class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :new_recipes

  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
end
