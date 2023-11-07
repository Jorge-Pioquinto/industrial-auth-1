class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def create?
    user.present? && user != follow_request.recipient && !user.following?(follow_request.recipient)
  end

  def update?
    user.present? && user == follow_request.recipient
  end

  def destroy?
    user.present? && user == follow_request.sender
  end

end
