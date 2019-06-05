$ALL_FIGHTERS = [] # Array.new

class Warrior
    attr_accessor :name, :hp, :mp, :atk, :magic, :status, :speed, :ct
    def initialize(name)
        @name = name
        self.hp = 100
        self.mp = 10
        self.atk = 30
        self.magic = 5
        self.status = 'alive'
        self.speed = 7
        self.ct = 0 # charge time
        $ALL_FIGHTERS << self
    end

    def attack(target)
      target.hp -= self.atk
      puts "#{@name} attacked #{target.name}"
        if target.hp < 1
            target.status = 'fallen'
            $ALL_FIGHTERS.delete(target)
            puts "#{target.name} has fallen!"
        end
    end
end

class Mage
    attr_accessor :name, :hp, :magic, :atk, :mp, :status, :speed, :ct
    def initialize(name)
        @name = name
        self.hp = 60
        self.mp = 100
        self.atk = 10
        self.magic = 40
        self.status = 'alive'
        self.speed = 5
        self.ct = 0 # charge time
        $ALL_FIGHTERS << self
    end

  def cast_spell(target)
    target.hp -= self.magic
        puts "#{@name} casted Firaga on #{target.name}"
        if target.hp < 1
            target.status = 'fallen'
            puts "#{target.name} has burned!"
        end
    end
end

def take_turn(player)
      if player.class == Warrior
            puts "#{player.name}'s turn! Select an Action\n1 - Attack\n2 - Pass\n3 - Quit\n\n"
            answer = gets.chomp.to_i
            if answer == 1
                puts "Who will you attack?"
                $ALL_FIGHTERS.each do |f|
                    if f.name == player.name
                        puts "Attack yourself"
                    else
                        puts f.name
                    end
                end
                target = gets.chomp.to_i
                if target > ($ALL_FIGHTERS.length - 1)
         puts "You missed"
                else
                player.attack($ALL_FIGHTERS[target])
                end
            elsif answer == 2
                puts "Skipping turn ..."
            elsif answer == 3
                puts "Exiting game"
                $battle_time = false
            else
                puts "Invalid input"
            end
        else
            puts "Select an Action\n1 - Cast Spell\n2 - Pass\n3 - Quit"
            answer = gets.chomp.to_i
            if answer == 1
                puts "#{player.name} casted magic!"
            elsif answer == 2
                puts "Skipping turn ..."
            elsif answer == 3
                puts "Exiting game"
                $battle_time = false
            else
                puts "Invalid input"
            end
        end
end

def start_battle(fighters)
  puts "Battle begins!"
    $battle_time = true
    turn_count = 0
  while $battle_time
    fighters.each do |fighter|
            fighter.ct += fighter.speed
            if fighter.ct >= 100
                take_turn(fighter)
                fighter.ct = 0
            end
        end
    end
end


roy = Warrior.new('Roy')
marth = Warrior.new('Marth')
robin = Mage.new('Robin')

start_battle($ALL_FIGHTERS)

weapons []
armour []

class equipment():
  Pass
  
