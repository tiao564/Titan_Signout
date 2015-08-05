class Sout < ActiveRecord::Base
  validates :item_name,
		:presence => {:message => "is a required field."}
  validates :borrowed_by,
		:presence => {:message => "is a required field."}
end
