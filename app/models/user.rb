class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :properties
  validates_uniqueness_of :email
  mount_uploader :profile_pic ,PictureUploader

  has_many :orders
  def make_admin
    self.update!(admin: true)
  end

end
