class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def show?
    user == photo.owner ||
      !photo.owner.private? ||
      photo.owner.followers.include?(user)
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user == photo.owner
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

end