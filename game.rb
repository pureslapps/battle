ALL_UNITS = []

class Unit
  attr_accessor :name, :hp, :mp, :speed, :ct, :maxhp, :maxmp, :atk, :status #getter and setter methods
  def initialize(name) #constructor
    self.name = name
    self.hp = 50 # default values
    self.mp = 10
    self.atk = 10
    self.speed = 5
    self.ct = 0
    self.maxhp = 5
    self.maxmp = 10
    self.status = 'alive'
    ALL_UNITS << self
  end

  def attack(target) # method
    puts"#{self.name} attacked #{target.name}"
  end
end

class Squire < Unit # inheritance

  def initialize(name)
    super(name) #function that calls the Superclass's constructor method
  end


# we can specify unique methods
# or overwrite methods from the parent by using the same name
  def throw_stone(target)
    puts "#{self.name} throws a stone..."
  end
end


class Wizard < Unit
  def initialize(name)
    super(name)
    self.hp -= 10 # we can alter default values by specifing only what is unique about Wizard objects
    self.speed -= 2
    self.mp += 30
  end

  def cast()
    puts "#{self.name} casted magic"
  end
end


class Knight < Unit
  def initialize(name)
    super(name)
    self.hp += 10
    self.atk += 5
    self.mp -= 5
  end

  def rend_armor()
    "#{self.name} rent armor! Everything is now rent!"
  end
end

def battle_is_over? # boolean function/method. The "?" is only for readability. THese methods should only return t/f
  dead_units = []
  ALL_UNITS.each do |unit|
    if Unit.status == 'alive'
      dead_units << false
    else
      dead_units << true
    end
  end
  if dead_units.count(false) > 1
    return false # it is important to return a true or fasle value in these functions
  end
end

def take_turn(u)
  puts "#{u.name}'s turn! what will you do?"
  puts "1 - Attack/n2 - Special/n3 - Wait"
  choice = gets.chomp.to_i
  case choice # cleaner syntax for an if statement but they do the exact same thing 
  when 1
    puts "#{u.name} attacked"
    u.ct -= 25
  when 2
    puts "#{u.name} used a Special move!"
    u.ct -= 50
  when 3
    puts "waiting..."
    u.ct = 50
  else
    puts "INVALID SELECTION"
  end
end

def start_battle
  battle_time = true
  while battle_time
    if battle_is_over?
      break
    end
    ALL_UNITS.each do |unit|
      unit.ct += unit.speed
      sleep 0.1  # sleep will stall execution of the program for n seconds
      puts "#{unit.name}"
      if unit.ct >= 100
        unit.ct = 100
        unit.take_turn(unit)
        unit.ct = 0
      end
    end
  end
end


roy = Knight.new('Roy') # Object.new is how we run a class's constructor method
robin = Wizard.new('Robin')
marth = Squire.new('Marth')

start_battle
