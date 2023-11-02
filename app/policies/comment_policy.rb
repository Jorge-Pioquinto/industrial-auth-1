class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present? && (user == comment.photo.owner || !comment.photo.owner.private? || comment.photo.owner.followers.include?(user))
  end

  def new?
    create?
  end

  def update?
    user == comment.author
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def show?
    user == comment.photo.owner || !comment.photo.owner.private? || comment.photo.owner.followers.include?(user)
  end

end
