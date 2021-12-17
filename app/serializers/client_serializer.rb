class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_fees

  def total_fees
    memberships = self.object.memberships
    cost = 0
    memberships.each{|membership| cost += membership.charge}
    cost
  end

end
