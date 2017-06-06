# Role model class
class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :departament
end
