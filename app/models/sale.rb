class Sale < ActiveRecord::Base
  def self.active
    self.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    self.ends_on < Date.current
  end

  def upcoming?
    self.starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end
end
