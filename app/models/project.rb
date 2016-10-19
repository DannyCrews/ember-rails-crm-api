class Project < ApplicationRecord
  enum status: [:active, :archived]

  validates :name, presence: true

  has_and_belongs_to_many :contacts
  has_many :tasks
  has_many :offers
  has_many :notes, as: :topic
end
