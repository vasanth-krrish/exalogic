class User < ApplicationRecord
  rolify

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :basicinfo, dependent: :destroy
  has_many :emergencyinfos, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :accinfos, dependent: :destroy
end
