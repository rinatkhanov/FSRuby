class PageDecorator < ApplicationDecorator
  delegate :title, :url, :index, :content, :user

  def author
    user.full_name
  end
end
