# require "./voter"
#
# def test_voter
#   name = "Sandy"
#   politics = "Progressive"
#   v = Voter.new(name, politics)
#   raise "Wrong name" unless v.name == name
#   raise "Wrong politics" unless v.politics == politics
#   v
# end
#
# voter = test_voter
#
# require "./candidate"
#
# def test_candidate(voter)
#   name = "Mike"
#   party = "Republican"
#   c = Candidate.new(name, party)
#   raise "Wrong name" unless c.name == name
#   raise "Wrong party" unless c.party == party
# end
#
# def test_campaign
#   campaign = Campaign.new voters, candidates
#   winner = campaign.run
#   puts winner.name, winner.party
# end
#
# test_candidate(voter)
#
# @voters = [
#   Voter.new("Amy", "Progressive"),
#   Voter.new("Burt","Libertarian"),
#   Voter.new("Charlie", "Independent"),
#   Voter.new("Darlene", "Conservative"),
#   Voter.new("Edgar", "Massachusetts Democrat"),
# ]
#
# @candidates = [
#   Candidate.new("Sam", "Republican"),
#   Candidate.new("Rebecca", "Democrat"),
#   Candidate.new("Theo", "Republican"),
#   Candidate.new("Ulrich", "Republican"),
#   Candidate.new("Victor", "Republican"),
#   Candidate.new("Walter", "Republican")
# ]
@voters = [
  ["Amy", "Progressive"],
  ["Burt","Libertarian"],
  ["Charlie", "Independent"],
  ["Darlene", "Conservative"],
  ["Edgar", "Massachusetts Democrat"],
]

@candidates = [
  ["Sam", "Republican"],
  ["Rebecca", "Democrat"],
  ["Theo", "Republican"],
  ["Ulrich", "Republican"],
  ["Victor", "Republican"],
  ["Walter", "Republican"]
]
#
# voters += candidates
#
# candidates.each do |c|
#   c.votes = c.stump(voters)
# end
#
# winner = "test"# The candidate with the most votes


def listen
  # I don't know how to seperate Candidates by party
  case @candidates.include?('')
  when "Republican"
    @voters.each do |voter|
      # Verbal Argument will be in stump speach lol
      if voter[1] == "Libertarian" && rand < 0.90
        puts "Voting Republican"
        true
      elsif voter[1] = "Conservative" && rand < 0.75
        puts "Voting Republican"
        true
      elsif voter[1] = "Independent" && rand < 0.50
        puts "Voting Republican"
        true
      elsif voter[1] = "Progressive" && rand < 0.25
        puts "Voting Republican"
        true
      elsif voter[1] = "Massachusetts Democrat" && rand < 0.10
        puts "Voting Republican"
        true
      else
        false
      end
    end
  when "Democrat"
    @voters.each do |voter|
      # Verbal Argument will be in stump speach lol
      if voter[1] == "Libertarian"    && rand > 0.90
        puts "Voting Democrat"
        true
      elsif voter[1] = "Conservative" && rand > 0.75
        puts "Voting Democrat"
        true
      elsif voter[1] = "Independent"  && rand > 0.50
        puts "Voting Democrat"
        true
      elsif voter[1] = "Progressive"  && rand > 0.25
        puts "Voting Democrat"
        true
      elsif voter[1] = "Massachusetts Democrat" && rand > 0.10
        puts "Voting Democrat"
        true
      else
        false
      end
    end
  else
    puts "Not valid."
    listen
  end
end

listen









































#
