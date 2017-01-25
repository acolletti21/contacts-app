class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime('%b %e, %Y')
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}".titleize
  end

  def country_code
    "+81 " + phone_number 
  end
end
