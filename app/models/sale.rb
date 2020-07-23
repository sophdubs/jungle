class Sale < ActiveRecord::Base
  # AR Scope
  def self.active
    return where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    ends_on < Date.current 
  end

  def upcomming? 
    starts_on > Date.current
  end

  def active? 
    !upcomming? && !finished?
  end
end
