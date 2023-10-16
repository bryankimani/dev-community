class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :work_experiences, dependent: :destroy

  PROFILE_TITLE = [
    'Product Manager',
    'Senior Developer',
    'Mid-Level Developer',
    'Junior Developer'
  ].freeze

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def address
    "#{city} #{state} #{country}".strip
  end

  def self.ransackable_attributes(auth_object = nil)
    ["city", "country"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
