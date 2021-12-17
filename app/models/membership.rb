class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client
  validates :client_id, :gym_id, :charge, presence: true
  validate :only_one_membership

  def only_one_membership
    if client_id != nil
      client = Client.find(client_id)
      gyms = client.gyms
      gyms.each do |gym|
        if gym.id == gym_id
          errors.add(:duplicate_membership, "Clients cannot have more than one membership at the same gym.")
        end
      end
    end
  end

end
