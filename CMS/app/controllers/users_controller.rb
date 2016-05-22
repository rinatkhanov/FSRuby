class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action do
    redirect_to root_path unless policy.manage?
  end

  respond_to :html

  expose_decorated(:user, attributes: :user_params)
  expose(:policy) { UserPolicy.new(current_user, user) }

  def index
    all = User.all.decorate
    @admins = all.select { |u| u.admin? }
    @users = all.reject { |u| u.admin? }
  end

  def downgrade
    change_role_to 'user'
  end

  def upgrade
    change_role_to 'administrator'
  end

  private

  def change_role_to x
    user.role = x
    user.save
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:id, :full_name, :role)
  end

end
