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
  attr_reader :candidates, :voters, :party, :poll_results

  def initialize(candidates, voters)
    @candidates     = candidates
    @voters         = voters
    @poll_results   = {Democrat: 0, Republican: 0}
  end
  #
  # def stump_given
  #   puts "#{@candidates}"
  #   puts "#{@voters}"
  # end

  def check_for_voters
    @candidates.each do |candidate|
      @voters.each do |voter|
        politics(candidate, voter)
      end
    end
  end

  def politics(candidate, voter)
    # puts "Candidates-Name: #{candidate.name} ---- Candidate-Party: #{candidate.party}"
    # puts "Voter: #{voter.name}"
    # There is actually a range of politics within
    # each party, so this isn't so cut-and-dry.
    case candidate.party
    when "Republican"
      if voter.politics.eql? 'Libertarian'
        if rand > 0.10
            @poll_results[:Republican] += 1
          p "Vote for me I will steal money for you! Republicans + 1!!!!"
          # @dem = @poll_results[:Democrat]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Conservative'
        if rand > 0.25
            @poll_results[:Republican] += 1
            p "Vote for me I will steal money for you! Republicans + 1!!!!"
          # @dem = @poll_results[:Democrat]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Independent'
        if rand > 0.50
            @poll_results[:Republican] += 1
            p "Vote for me I will steal money for you! Republicans + 1!!!!"
          # @dem = @poll_results[:Democrat]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Progressive'
        if rand > 0.75
            @poll_results[:Republican] += 1
            p "Vote for me I will steal money for you! Republicans + 1!!!!"
          # @dem = @poll_results[:Democrat]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Massachusetts Democrat'
        if rand > 0.90
            @poll_results[:Republican] += 1
            p "Vote for me I will steal money for you! Republicans + 1!!!!"
          # @dem = @poll_results[:Democrat]
          # tally(candidate, voter)
          # true
        end
      else
        puts "Republican Failed"
        false
      end
    when "Democrat"
      if voter.politics.eql? 'Libertarian'
        if rand < 0.10
            @poll_results[:Democrat] += 1
          p "Vote for me because I am Robin Hood. Democrats + 1!!!!!!!"
          # @rep = @poll_results[:Republican]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Conservative'
        if rand < 0.25
            @poll_results[:Democrat] += 1
            p "Vote for me because I am Robin Hood. Democrats + 1!!!!!!!"
          # @rep = @poll_results[:Republican]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Independent'
        if rand < 0.50
            @poll_results[:Democrat] += 1
            p "Vote for me because I am Robin Hood. Democrats + 1!!!!!!!"
          # @rep = @poll_results[:Republican]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Progressive'
        if rand < 0.75
            @poll_results[:Democrat] += 1
            p "Vote for me because I am Robin Hood. Democrats + 1!!!!!!!"
          # @rep = @poll_results[:Republican]
          # tally(candidate, voter)
          # true
        end
      elsif voter.politics.eql? 'Massachusetts Democrat'
        if rand < 0.90
            @poll_results[:Democrat] += 1
            p "Vote for me because I am Robin Hood. Democrats + 1!!!!!!!"
          # @rep = @poll_results[:Republican]
          # tally(candidate, voter)
          # true
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

  def results_are_in
    if @poll_results[:Democrat] > @poll_results[:Republican]
      puts "The Democrats have Won! We don't have to go to War! #{@poll_results[:Democrat]}"
    elsif @poll_results[:Democrat] < @poll_results[:Republican]
      puts "The Republicans have Won! Let's stack paper! #{@poll_results[:Republican]}"
    else
      puts "It's a tie! No Body cares!"
    end
  end

end

candidates = [Candidate.new("Hillary", "Democrat"), Candidate.new("Bush", "Republican")]
voters     = [Voter.new("Eron", "Republican", "Libertarian"), Voter.new("Jose", "Republican", "Conservative"), Voter.new("Steve", "Democrat", "Massachusetts Democrat"), Voter.new("John", "Democrat", "Independent")]

run_sim = RunSimulation.new(candidates, voters)
# run_sim.stump_given
run_sim.check_for_voters
run_sim.results_are_in

































# Hidden Might Use
#
# def tally(candidate, voter)
#   @poll_results.each do |election, index|
#     if @poll_results[:Democrat]
#       p "Democrats won that vote #{@poll_results[:Democrat]}"
#         @poll_results[:Democrat] += 1
#     elsif @poll_results[:Republican]
#       p "Republicans won that vote #{@poll_results[:Republican]}"
#         @poll_results[:Republican] += 1
#     else
#       puts "Not valid!"
#     end
#   end
# end
