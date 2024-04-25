class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def edit?
    update?
  end
    def update?
      # se for admin || for o criador do article
      user&.admin? || user&.id == record.user_id
    end

    def destroy?
      # se for admin || for o criador do article
      user&.admin? || user&.id == record.user_id
    end

end
