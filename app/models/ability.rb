class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role? :customer
      can :manage, Shop
      can :manage, Booking
      can :manage, User
      can :read,   Company
    end

    if user.role? :provider
      can :manage, Company
      can :manage, Product
      can :manage, User
      can :read,   Booking
      can :read,   Shop
    end

  end

end
