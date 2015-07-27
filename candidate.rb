# require './voter'

# class Candidate < Voter
#   attr_accessor :name, :party
#
#   def initialize(name, party)
#     @name = name
#     @party = party
#   end
#
#   def politics
#     # There is actually a range of politics within
#     # each party, so this isn't so cut-and-dry.
#     if party == "Republican"
#       "Conservative"
#     else
#       "Progressive"
#     end
#   end
#
#   def stump(voters)
#     voters.each do |v|
#       v.listen(party)
#
#     end
#   end
# end
