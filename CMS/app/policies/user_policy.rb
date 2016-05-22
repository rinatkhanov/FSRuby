class UserPolicy < ApplicationPolicy
  def initialize(user)
    @user = user
  end
  
  def manage?
    @user.role == 'administrator'
  end
end
