class UserPolicy < ApplicationPolicy
  def manage?
    @user.role == 'administrator'
  end
end
