class Link < ActiveRecord::Base

  validates :title, presence: true
  validates :link_url, presence: true
  validates :link_url, :url => {:allow_blank => false}

end
