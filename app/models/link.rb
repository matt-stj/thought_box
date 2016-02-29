class Link < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :link_url, presence: true
  validates :link_url, :url => {:allow_blank => false}

end
