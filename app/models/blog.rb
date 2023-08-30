# == Schema Information
#
# Table name: blogs
#
#  id               :bigint           not null, primary key
#  content          :text
#  publication_date :datetime
#  title            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_blogs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_and_belongs_to_many :categories
  # has_and_belongs_to_many :tags

  validates :title, :content, presence: true
end
