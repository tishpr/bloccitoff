class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  mount_uploader :avatar, AvatarUploader
    has_many :items, dependent: :destroy

  def admin?
   role == 'Project Manager'
  end

end
