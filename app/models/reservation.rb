class Reservation < ActiveRecord::Base

  validate :overbooking

  private

  def overbooking
    conditions = [
      '(start_at > :start_at and start_at < :end_at)',
      '(end_at > :start_at and end_at < :end_at)',
      '(:start_at > start_at and :start_at < end_at)',
      '(:end_at > start_at and :end_at < end_at)'
    ].join(' or ')
    conditions = "(#{conditions}) and \"table\" = :table"
    if self.class.where(conditions, self.attributes.symbolize_keys).count > 0
      self.errors.add(:start_at, I18n.t(:overbooking))
      self.errors.add(:end_at, I18n.t(:overbooking))
    end
  end
end
