# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  provider      :string(255)
#  uid           :string(255)
#  name          :string(255)
#  email         :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  admin         :boolean
#  private_token :string(255)
#

class User < ActiveRecord::Base
  before_save :set_private_token

  has_many :episodes
  has_many :votes

  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || auth['info']['email'].try(:split, '@').try(:first) || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  private
  def set_private_token
    self.private_token = SecureRandom.urlsafe_base64
  end

end
