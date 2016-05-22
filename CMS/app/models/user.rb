class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  has_many :pages, dependent: :destroy

  validates :full_name, presence: true
end
