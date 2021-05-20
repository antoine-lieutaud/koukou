class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.travel.capacity - record.travel.total_bookings != 0
  end

  def new?
    true
  end

  def confirmation?
    true
  end
  
end
