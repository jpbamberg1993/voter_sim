# Choose a party
#################################################################
def choose_party
  print "Party? Democrat or Republican: "
  party = gets.chomp.downcase
  @party = party[0]
  case @party
  when "d"
    puts "You are a Democrat!"
    @party = "Democrat"
  when "r"
    puts "You are a Republican!"
    @party = "Republican"
  else
    puts "That is not a party we care about!"
    choose_party
  end
end

# Choose Politics
#################################################################
def choose_politics
  print "Politics? Progressive, Conservative, Libertarian, Massachusetts Democrat, or Independent: "
  politics = gets.chomp.downcase
  @politics = politics[0]
  case @politics
  when "p"
    @politics = "Progressive"
    puts "Your a #{@politics}!"
  when "c"
    @politics = "Conservative"
    puts "Your a #{@politics}!"
  when "l"
    @politics = "Libertarian"
    puts "Your a #{@politics}!"
  when "m"
    @politics = "Massachusetts Democrat"
    puts "Your a #{@politics}!"
  when "i"
    @politics = "Independent"
    puts "Your a #{@politics}!"
  else
    puts "That's not a valid option!"
    choose_politics
  end
end


class MainMenu

def initialize
  @voters       = Array.new
  @candidates   = Array.new
end

# Player takes intial decision about how to proceed with the game
#################################################################
  def main_selector
    print "What would you like to do? Create, List, Update, or Vote: "
    main_decision = gets.chomp.downcase
    main_decision = main_decision[0]
    case main_decision
    when "c"
      create_person_or_politician
    when "l"
      list_characters_created
    when "u"
      update_character
    when "v"
      vote
    else
      puts "That is not a valid entry please try again!"
      main_selector
    end
  end

# Primary menu of options
#################################################################
  def create_person_or_politician
    print "Would you like to create a Voter or Candidate? "
    main_decision = gets.chomp.downcase
    main_decision = main_decision[0]
    case main_decision
    # Voter chosen
    #################################################################
    when "v"
      print "Name: "
      @name = gets.chomp
      choose_party
      choose_politics
      @voters.push(Voter.new(@name, @party, @politics)) # Not sure if correct
      main_selector
    # Candidate chosen
    #################################################################
    when "c"
      print "Name: "
      @name = gets.chomp
      choose_party
      @candidates.push(Candidate.new(@name, @party))
      main_selector
    else
      puts "That is not a valid entry please try again!"
      create_person_or_politician
    end
  end

  # List of Arrays created
  #################################################################
  def list_characters_created
    @candidates.each do |candidate|
      puts "-----Candidate-----"
      puts("Name:   #{candidate.name};")
      puts("Party:  #{candidate.party};")
    end
    @voters.each do |voter|
      puts "-----Voter-----"
      puts("Name:     #{voter.name};")
      puts("Party:    #{voter.party};")
      puts("Politics: #{voter.politics};")
    end
    main_selector
  end

  def update_character
    puts "Do you want to delete or update?"
    decision = gets.chomp.downcase
    decision = decision[0]
    case decision
    when "d"
      puts "(C)andidate or (V)oter?"
      case gets.chomp.downcase
      when "c"
        puts "What the name?"
        name = gets.chomp
        @candidates.each do |candidate|
          if candidate.name.eql? name
            @candidates.delete(candidate)
            main_selector
          else
            puts "We don't have that name! Remember case sensitive!"
          end
        end
      when "v"
        puts "What's the name?"
        name = gets.chomp
        @voters.each do |voter|
          if voter.name.eql? name
            @voters.delete(voter)
            main_selector
          end
        end
      else
        puts "Try again!"
        update_character
      end
    when "u"
      print "(C)andidate or (V)oter? "
      case gets.chomp.downcase
      when "c"
        print "What is his name? "
        name = gets.chomp
        print "(N)ame? (P)arty? "
        case gets.chomp.downcase
        when "n"
          @candidates.each do |candidate|
            if candidate.name.eql? name
              puts "What do you want the new name to be?"
              candidate.name = gets.chomp
              main_selector
            end
          end
        when "p"
          @candidates.each do |candidate|
            if candidate.name.eql? name
              puts "What do you want the new party to be?"
              candidate.party = gets.chomp
              main_selector
            end
          end
        else
          puts "Fuck off!"
        end
      when "v"
        print "What is his name?"
        name = gets.chomp
        print "(N)ame? (P)art? (Po)litics? "
        case gets.chomp.downcase
        when "n"
          @voters.each do |voter|
            if voter.name.eql? name
              puts "What do you want the name to be?"
              voter.name = gets.chomp
              main_selector
            end
          end
        when "p"
          @voters.each do |voter|
            if voter.name.eql? name
              puts "What do you want the party to be?"
              voter.party = gets.chomp
              main_selector
            end
          end
        when "po"
          @voters.each do |voter|
            if voter.name.eql? name
              puts "What do you want the politics to be?"
              voter.politics = gets.chomp
              main_selector
            end
          end
        else
          puts "I don't caare about you anymore!"
          main_selector
        end
      else
        puts "Try again!"
        update_character
      end
    else
      puts "Try again!"
      update_character
    end
  end

  def vote
    run_sim = RunSimulation.new(@candidates, @voters)
    run_sim.check_for_voters
    run_sim.results_are_in
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

#Testing Class Within File
class Candidate
  attr_accessor :name, :party

  def initialize(name, party)
    @name = name
    @party = party
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

test = MainMenu.new
test.main_selector


































#
# class RunSimulation
#   attr_reader :voters, :election_day
#
#   def initialize(candidates, voters)
#     @candidates     = candidates
#     @voters         = voters
#     @election_day   = Hash.new
#   end
#
#   def stump_given
#     puts "#{@candidates}"
#     puts "#{@voters}"
#   end
#
#   def politics(voter)
#     # There is actually a range of politics within
#     # each party, so this isn't so cut-and-dry.
#     case @party
#     when "Republican"
#       if voter.politics.eql? 'Libertarian' && rand > 0.10
#         tally(voter)
#       elsif voter.politics.eql? 'Conservative' && rand > 0.25
#         tally(voter)
#       elsif voter.politics.eql? 'Independent' && rand > 0.50
#         tally(voter)
#       elsif voter.politics.eql? 'Progressive' && rand > 0.75
#         tally(voter)
#       elsif voter.politics.eql? 'Massachusetts Democrat' && rand > 0.90
#         tally(voter)
#       else
#         false
#       end
#     when "Democrat"
#       if voter.politics.eql? 'Libertarian' && rand < 0.10
#         tally(voter)
#       elsif voter.politics.eql? 'Conservative' && rand < 0.25
#         tally(voter)
#       elsif voter.politics.eql? 'Independent' && rand < 0.50
#         tally(voter)
#       elsif voter.politics.eql? 'Progressive' && rand < 0.75
#         tally(voter)
#       elsif voter.politics.eql? 'Massachusetts Democrat' && rand < 0.90
#         tally(voter)
#       else
#         false
#       end
#     else
#       false
#     end
#   end
#
#   def tally(candidate, voter)
#     @election_day[candidate.name] += 1
#   end
#
# end














#
