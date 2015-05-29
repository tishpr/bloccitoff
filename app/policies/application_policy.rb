class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    user.present? && (record.user == user || user.admin?)     #scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def destroy?
    show?
  end

  def scope
    record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

