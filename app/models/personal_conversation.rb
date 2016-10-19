class PersonalConversation < Note
  belongs_to :contact, optional: true
end
