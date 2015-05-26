class Item < ActiveRecord::Base
  default_scope { order('created_at DESC') }
    belongs_to :user

   def days_left
    t = Time.now
    t = t.gmtime
      7 - (t.to_date - created_at.to_date).to_i    # this is not working correctly...
   end
end
