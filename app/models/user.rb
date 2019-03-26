class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true,
  length: { in: 2..20 }

  validates :intro,length: { maximum: 50 }

  def email_required?
  	false
  end
  def email_changed?
  	false
  end
end
