class Office < ApplicationRecord
  belongs_to :user, optional: true

  geocoded_by :postcode   # I will get it by postcode ONLY. It can also be an IP address if set. Check Documentation
  after_validation :geocode, if: :postcode_changed? and :postcode.present?

end
