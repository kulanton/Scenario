class User < ActiveRecord::Base

  before_create :setup_role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :nickname, :role_ids

  has_and_belongs_to_many :roles

  private

  def setup_role
    role = Role.where( name: 'Teacher' ).first
    self.role_ids = [role.id]
  end

end
