require_relative 'candidate'
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
    # When Voter chosen
    #################################################################
    when "v"
      print "Name: "
      @name = gets.chomp
      choose_party
      choose_politics
      @voters.push(Voter.new(@name, @party, @politics)) # Not sure if correct
      main_selector
    # When Candidate chosen
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
    @voters.each do |voter|
      puts("Name:     #{voter.name};")
      puts("Party:    #{voter.party}")
      puts("Politics: #{voter.politics};")
    end
    @candidates.each do |candidate|
      puts("Name:   #{candidate.name};")
      puts("Party:  #{candidate.party};")
    end
  end

  def update_character

  end

  def vote

  end

end

class Voter
  attr_accessor :voters, :name, :party, :politics

  def initialize(name, party, politics)
    @name		 	= name
    @party    = party
    @politics = politics
    @voted    = false
  end

  def listen(voter)
    # I don't know how to seperate Candidates by party
    case candidates.party
    when "Republican"
      @voters.each do |voter|
        # Verbal Argument will be in stump speach lol
        if voter.politics == "Libertarian" && rand < 0.90
          puts "Voting Republican"
          true
        elsif voter.politics = "Conservative" && rand < 0.75
          puts "Voting Republican"
          true
        elsif voter.politics = "Independent" && rand < 0.50
          puts "Voting Republican"
          true
        elsif voter.politics = "Progressive" && rand < 0.25
          puts "Voting Republican"
          true
        elsif voter.politics = "Massachusetts Democrat" && rand < 0.10
          puts "Voting Republican"
          true
        else
          false
        end
      end
    when "Democrat"
      @voters.each do |voter|
        # Verbal Argument will be in stump speach lol
        if voter.politics == "Libertarian" && rand > 0.90
          puts "Voting Democrat"
          true
        elsif voter.politics = "Conservative" && rand > 0.75
          puts "Voting Democrat"
          true
        elsif voter.politics = "Independent" && rand > 0.50
          puts "Voting Democrat"
          true
        elsif voter.politics = "Progressive" && rand > 0.25
          puts "Voting Democrat"
          true
        elsif voter.politics = "Massachusetts Democrat" && rand > 0.10
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
end

test = MainMenu.new
test.main_selector
































#
