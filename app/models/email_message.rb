class EmailMessage < Note
  belongs_to :contact, optional: true
end
