class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo, length: { maximum: 500 }

  validate :start_date_before_end_date

  private

  def start_date_before_end_date
    return if start_date.blank? || end_date.blank?

    if start_date > end_date
      errors.add(:end_date, "は、開始日以降の日付としてください。")
    end
  end
end
