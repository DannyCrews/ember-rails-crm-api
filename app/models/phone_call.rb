class PhoneCall < Note
  belongs_to :contact, optional: true
end
