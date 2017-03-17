class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, numericality: [greater_than: 0]
  
  has_many :resumes
  def hide!
    self.hidden = true
    self.save
  end
  def publish!
    self.hidden = false
    self.save
  end
  scope :published, -> {where(:hidden => false)}
end
