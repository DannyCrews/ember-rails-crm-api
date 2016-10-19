class OfferSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :status, :valid_until
  has_many :tasks
  has_many :contacts
  has_many :notes
  has_one :project
end
