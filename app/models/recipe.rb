class Recipe < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user, class_name: 'User'
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preperation_time, presence: true
  validates :cooking_time, presence: true
  validates :public, inclusion: [true, false]
  validates :public, exclusion: [nil]
end
