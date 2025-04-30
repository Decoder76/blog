module Visible
    extend ActiveSupport::Concern
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  end
  