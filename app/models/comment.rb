class Comment < ApplicationRecord
  #belongs_to :user
  belongs_to :article
  validates :body , presence: { message: "must be given please" }

  
  #Proc.new { | user, data |"#{data[:attribute]} is needed for all registrations!" } 
end
