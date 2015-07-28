class Candidate
  attr_accessor :name, :party

  def initialize(name, party)
    @name = name
    @party = party
  end
end

class Voter
  attr_accessor :name, :party, :politics

  def initialize(name, party, politics)
    @name = name
    @party = party
    @politics = politics
  end
end

class RunSimulation
  attr_reader :voters, :election_day

  def initialize(candidates, voters)
    @candidates     = candidates
    @voters         = voters
    @election_day   = Hash.new
  end

  def stump_given
    puts "#{@candidates}"
    puts "#{@voters}"
  end

  def check_for_voters
    @candidates.each  do |candidate|
      @voters.each do |voter|
        politics(candidate, voter)
      end
    end
  end

  def politics(candidate, voter)
    puts "Candidates-Name: #{candidate.name} ---- Candidate-Party: #{candidate.party}"
    puts "Voter: #{voter.name}"
    # There is actually a range of politics within
    # each party, so this isn't so cut-and-dry.
    case candidate.party
    when "Republican"
      if voter.politics.eql? 'Libertarian' && rand > 0.10
        tally(candidate, voter)
      elsif voter.politics.eql? 'Conservative' && rand > 0.25
        tally(candidate, voter)
      elsif voter.politics.eql? 'Independent' && rand > 0.50
        tally(candidate, voter)
      elsif voter.politics.eql? 'Progressive' && rand > 0.75
        tally(candidate, voter)
      elsif voter.politics.eql? 'Massachusetts Democrat' && rand > 0.90
        tally(candidate, voter)
      else
        puts "Republican Failed"
        false
      end
    when "Democrat"
      if voter.politics.eql? 'Libertarian'
        if rand < 0.10
          tally(candidate, voter)
        end
      elsif voter.politics.eql? 'Conservative'
        if rand < 0.25
          tally(candidate, voter)
        end
      elsif voter.politics.eql? 'Independent'
        if rand < 0.50
          tally(candidate, voter)
        end
      elsif voter.politics.eql? 'Progressive'
        if rand < 0.75
          tally(candidate, voter)
        end
      elsif voter.politics.eql? 'Massachusetts Democrat'
        if rand < 0.90
          tally(candidate, voter)
        end
      else
        puts "Democrat Failed"
        false
      end
    else
      puts "Method Failed"
      false
    end
  end

  def tally(candidate, voter)
    @election_day[candidate.name] += 1
    voters.delete(voter)
    puts "#{@election_day}"
  end


end

candidates = [Candidate.new("Hillary", "Democrat"), Candidate.new("Bush", "Republican")]
voters     = [Voter.new("Eron", "Republican", "Libertarian"), Voter.new("Jose", "Republican", "Conservative"), Voter.new("Steve", "Democrat", "Massachusetts Democrat"), Voter.new("John", "Democrat", "Independent")]

run_sim = RunSimulation.new(candidates, voters)
# run_sim.stump_given
run_sim.check_for_voters
