# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    if user.is_admin?
    true
    else
      false
    end
  end

  def create?
    true
  end

  def new?
    if user.is_admin?
      true
    else
      false
    end
  end

  def update?
    if user.is_admin?
      true
    else
      false
    end
  end

  def edit?
    if user.is_admin?
      true
    else
      false
    end
  end

  def destroy?
    if user.is_admin?
      true
    else
      false
    end
  end



    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  
end
