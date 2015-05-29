class Item < ActiveRecord::Base
  default_scope { order('created_at DESC') }
    belongs_to :user

    validates :user, presence: true
     validates :name, length: { minimum: 3 }, presence: true

   def days_left
    #binding.pry
      7 - (DateTime.now.utc.to_date - created_at.to_date).to_i   
   end
end
