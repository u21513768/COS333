class Employee
  attr_reader :earnings

  def initialize(base_salary = 20000.00)
    @earnings = 0.0
    @baseSalary = base_salary
    @baseSalaryPaid = false
  end

  def payEmployee
    unless @baseSalaryPaid
      @earnings += @baseSalary
      @baseSalaryPaid = true
    end
  end

  def newMonth
    @baseSalaryPaid = false
  end
end

class Manager < Employee
  def initialize(bonus)
    super()
    @bonus = bonus
  end

  def payEmployee
    super
    @earnings += @bonus
  end
end

class Programmer < Employee
  def initialize(percentage)
    computed_salary = 20000.00 * percentage
    super(computed_salary)
  end
end

class Team
  def initialize
    @members = []
  end

  def addMember(employee)
    raise "Cannot add more than 2 members to a team" if @members.size >= 2
    @members << employee
  end

  def payTeam
    @members.each(&:payEmployee)
  end

  def newMonth
    @members.each(&:newMonth)
  end

  def printEarnings
    @members.each { |member| puts "Earnings: #{member.earnings}" }
  end
end

# Test code
teams = []
2.times { teams << Team.new }

puts "Enter manager's bonus: "
manager_bonus = gets.to_f
manager = Manager.new(manager_bonus)

teams.each do |team|
  team.addMember(manager)
end

teams.each_with_index do |team, index|
  puts "Enter programmer #{index + 1}'s salary percentage (e.g., 0.5 for 50%): "
  percentage = gets.to_f
  programmer = Programmer.new(percentage)
  team.addMember(programmer)
end

loop do
  puts "Pay teams for another month? (y/n): "
  continue = gets.chomp
  break if continue.downcase == 'n'

  teams.each(&:payTeam)
  teams.each(&:newMonth)
end

teams.each_with_index do |team, index|
  puts "Team #{index + 1} earnings:"
  team.printEarnings
end
