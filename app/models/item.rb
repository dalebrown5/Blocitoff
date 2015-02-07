class Item < ActiveRecord::Base
  belongs_to :list

  def days_left
    ((created_at.to_date + 7) - DateTime.now.to_date).to_i 
  end

end
