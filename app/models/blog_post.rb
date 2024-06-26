class BlogPost < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    return published_at.nil?
  end

  def published?
    return published_at? && published_at <= Time.current
  end

  def scheduled?
    return published_at? && published_at > Time.current
  end
end
