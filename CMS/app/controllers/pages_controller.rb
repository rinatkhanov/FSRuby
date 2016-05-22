class PagesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose_decorated(:page, attributes: :page_params)
  expose(:policy) { PagePolicy.new(current_user, page) }

  def index
    @pages = Page.sorted.decorate
  end

  def show
    page = Page.find_by_url(params[:id]) || Page.find(params[:id])
    @page = page.decorate 
  end

  def new
  end

  def blog
    @pages = Page.includes(:user).where(static: false).decorate 
  end

  def create
    page.user = current_user

    flash[:notice] = "Page was successfully created." if page.save
    respond_with page, location: pages_path
  end

  def update
    if policy.edit?
      flash[:notice] = "Page was successfully updated." if page.save
      respond_with page, location: pages_path
    end
  end

  def destroy
    if policy.destroy?
      page.destroy
      respond_with page, location: pages_path
    end
  end

  def edit
    unless policy.edit?
      redirect_to pages_path
    end
  end

  private

  def page_params
    params.require(:page).permit(:user_id, 
                                 :title,
                                 :content,
                                 :index, 
                                 :url,
                                 :static)
  end
end
