# Ticket model class
class Ticket < ActiveRecord::Base
  belongs_to :departament
  belongs_to :author, class_name: 'User'
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
