class TravelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.pilot
  end

  def new?
    create?
  end

  def update?
    record.user == current_user
  end

  def edit?
    update?
  end

  def destroy?
    user.pilot
  end
end
