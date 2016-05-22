class PageDecorator < ApplicationDecorator
  delegate :title, :url, :index, :content, :user, :static

  def author
    user.full_name
  end
end
