class Page < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user

  scope :sorted, -> { Page.includes(:user).order(index: :asc) }
end
