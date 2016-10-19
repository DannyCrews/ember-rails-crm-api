class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :created_at
  has_many :contacts
  has_many :offers
  has_many :tasks
  has_many :notes
end
