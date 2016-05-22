class PagesController < ApplicationController
  
  expose(:page, attributes: :page_params)

  def new
  end

  def index
  end

  def create

    page.user = current_user
  	page.save

    respond_with page, location: pages_path
  end

  def show
  	
  end

  def update
  	page.save
  end

  def destroy
  	page.destroy
  end

  def page_params
    params.require(:page).permit(:user_id, 
                                 :title,
                                 :body)
  end
end
