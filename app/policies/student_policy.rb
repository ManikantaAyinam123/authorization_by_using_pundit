class StudentPolicy < ApplicationPolicy
  
    # NOTE: Be explicit about which records you allow access to!
    
    def index?
      true
    end

    def new?
      user.is_admin?
    end

    def create?
      user.is_admin?
    end

    def edit?
      user.is_admin?
    end

    def update?
      user.is_admin?
    end

    def destroy?
      user.is_admin?
    end
 
end
