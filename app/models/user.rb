class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %W[director coach admin parent facility_admin]
  
  before_validation :set_default_role, on: :create
  
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }

  # Role bitmask methods
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def has_role?(role)
    roles.include?(role)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def can_manage_users
    has_role?('director') || has_role?('admin')
  end

  def can_mange_teams
    has_role?('director') || has_role?('admin') || has_role?('coach')
  end

  def can_view_analytics
    has_role?('director') || has_role?('admin')
  end

  private

  def set_default_role
    self.roles_mask = 2**ROLES.index('parent') if roles.empty?
  end
end
