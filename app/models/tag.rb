# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :episodes, through: :taggings
  validates :name, presence: true

  def to_param
    name
  end
end
