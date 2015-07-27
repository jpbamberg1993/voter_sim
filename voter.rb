# Choose a party
#################################################################
def choose_party
  print "Party? Democrat or Republican: "
  @party = gets.chomp.downcase
  @party = @party[0]
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
  @politics = gets.chomp.downcase
  @politics = @politics[0]
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
    test_voting = Voter.new(@name, @party, @politics)
    test_voting.listen(@voters)
  end

end

class Voter
  attr_accessor :name, :party, :politics, :candidates, :voters

  def initialize(name, party, politics)
    @name		 	  = name
    @party      = party
    @politics   = politics
    @candidates = candidates
    @voters     = voters
    @voted      = false
  end

  def listen(voter)
    # I don't know how to seperate Candidates by party
    case candidates.include? ''
    when "Republican"
      @voters.each do |voter|
        # Verbal Argument will be in stump speach lol
        if voter.politics == "Libertarian" && rand < 0.90
          true
        elsif voter.politics = "Conservative" && rand < 0.75
          true
        elsif voter.politics = "Independent" && rand < 0.50
          true
        elsif voter.politics = "Progressive" && rand < 0.25
          true
        elsif voter.politics = "Massachusetts Democrat" && rand < 0.10
          true
        else
          false
        end
      end
    when "Democrat"
      @voters.each do |voter|
        # Verbal Argument will be in stump speach lol
        if voter.politics == "Libertarian" && rand > 0.90
          true
        elsif voter.politics = "Conservative" && rand > 0.75
          true
        elsif voter.politics = "Independent" && rand > 0.50
          true
        elsif voter.politics = "Progressive" && rand > 0.25
          true
        elsif voter.politics = "Massachusetts Democrat" && rand > 0.10
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
end

#Testing Class Within File
class Candidate < Voter
  attr_accessor :name, :party, :votes, :vote_counter

  def initialize(name, party)
    @name         = name
    @party        = party
    @votes        = votes
    @vote_counter = Hash.new {|name, votes| @name[@votes] = 1}
  end

  # Already did when creating person
  # def politics
  #   # There is actually a range of politics within
  #   # each party, so this isn't so cut-and-dry.
  #   if party == "Republican"
  #     "Conservative"
  #   else
  #     "Progressive"
  #   end
  # end

  def stump(voters)
    voters.each do |v|
      v.listen(party)
      if voters.eql?("Democrat")
        print "Voting Blue"
        @votes += 1
      elsif voters.eql?("Republican")
        print "Voting Red"
        @votes += 1
      else
        print "Not Voting"
      end
    end
  end
end

test = MainMenu.new
test.main_selector
















































#
