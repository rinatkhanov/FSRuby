class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :role

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def admin?
  	object.role == 'administrator'
  end
end
