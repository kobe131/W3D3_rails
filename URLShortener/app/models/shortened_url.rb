class ShortenedURL < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, :submitter, presence: true
  
  def self.create_from_long(user,long_url)
    ShortenedURL.create!(
      submitter: user.id,
      long_url: long_url,
      short_url: ShortenedURL.random_code
    )
  end
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :submitter,
    class_name: :User
  
  def self.random_code
    # loop do 
      # code = SecureRandom.urlsafe_base64(16) 
    return code unless ShortenedUrl.exists?(short_url: code)
    # end
  end
  
end