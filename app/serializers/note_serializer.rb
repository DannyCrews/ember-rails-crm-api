class NoteSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :description
  has_one :topic
end
