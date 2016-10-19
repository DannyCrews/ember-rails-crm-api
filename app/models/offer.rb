class Offer < ApplicationRecord
  enum status: [:active, :accepted, :rejected, :expired]

  validates :name, presence: true

  belongs_to :project
  has_and_belongs_to_many :contacts
  has_many :tasks
  has_many :notes, as: :topic

end
