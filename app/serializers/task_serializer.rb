class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :status, :due_at
  has_one :project
  has_one :offer
end
