# Departament model class
class Departament < ActiveRecord::Base
  has_many :tickets, dependent: :delete_all
  validates :name, presence: true
  has_many :roles, dependent: :delete_all
end
