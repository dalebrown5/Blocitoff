class Item < ActiveRecord::Base
  belongs_to :list

   def days_left
    (DateTime.now.to_date - (item.created_at.to_date + 7)).to_i  
   end

end
<%= item.days_left %>
