class LikePolicy < ApplicationPolicy
  attr_reader :user, :like

  def initialize(user, like)
    @user = user
    @like = like
  end

  def create?
    user.present? && (user == like.photo.owner || !like.photo.owner.private? || like.photo.owner.followers.include?(user))
  end

  def destroy?
    user == like.photo.owner || !like.photo.owner.private? || like.photo.owner.followers.include?(user)
  end

end
