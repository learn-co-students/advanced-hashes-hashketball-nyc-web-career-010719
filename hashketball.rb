require "pry"

def game_hash
    master_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                "Alan Anderson" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                "Reggie Evans" => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7
                },
                "Brook Lopez" => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                "Mason Plumlee" => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                "Jason Terry" => {
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Jeff Adrien" => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                "Bismak Biyombo" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                "DeSagna Diop" => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                "Ben Gordon" => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                "Brendan Haywood" => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12
                }
            }
        }
        
    }
end



def num_points_scored(player)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |person, person_data|
                    if person == player
                        person_data.each do |stat, value|
                            if stat == :points
                                return value
                            end
                        end
                    end
                end
            end
        end
    end
end


def shoe_size(player)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |person, person_data|
                    if person == player
                        person_data.each do |stat, value|
                            if stat == :shoe
                                return value
                            end
                        end
                    end
                end
            end
        end
    end
end


def team_colors(team)
    loc = ""
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data == team
                loc = location
            end
        end
    end
    game_hash[loc][:colors]
end


def team_names
    teams =[]
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :team_name
                teams << data
            end
        end
    end
    teams
end


def player_numbers(team)
    loc = ""
    jersey_numbers = []
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data == team
                loc = location
            end
        end
    end

    game_hash[loc][:players].each do |person, person_data|
        person_data.each do |stat, value|
            if stat == :number
                jersey_numbers << value
            end
        end
  end
  jersey_numbers

end

def player_stats(player)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |person, person_data|
                    if person == player
                        return person_data
                    end
                end
            end
        end
    end
end



def largest_shoe
   shoe_wearer = ""
   shoe_compare = 0
   game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |person, person_data|
                        person_data.each do |stat, value|
                            if stat == :shoe
                                if value > shoe_compare
                                    shoe_compare = value
                                    shoe_wearer = person
                                end
                            end
                        end
                    end
                end
            end
        end
    shoe_wearer
end



def big_shoe_rebounds
        game_hash.each do |location, team_data|
            team_data.each do |attribute, data|
                if attribute == :players
                    data.each do |person, person_data|
                        if person == largest_shoe
                            person_data.each do |stat, value|
                                if stat == :rebounds
                                    return value
                                end
                            end
                        end
                    end
                end
            end
        end
end



#Bonus questions below

def most_points_scored
    point_compare = 0
    best_player = ""
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |person, person_data|
                    person_data.each do |stat, value|
                        if stat == :points
                            if value > point_compare
                                point_compare = value
                                best_player = person
                            end
                        end
                    end
                end
            end
        end
    end
    best_player
end




def points_per_team(team)
    loc = ""
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data == team
                loc = location
            end
        end
    end
    
    total_points = 0
    game_hash[loc][:players].each do |person, person_data|
        person_data.each do |key, value|
            if key == :points
                total_points += value
            end
        end
    end
                
    total_points
end


def winning_team
    winner = ""
    point_compare = 0
    team_names.each do |team|
        if points_per_team(team) > point_compare
          point_compare = points_per_team(team)
          winner = team
        end
    end
    winner
end




def player_with_longest_name

    letter_compare = 0
    player_name = ""

    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |person, person_data|
                    if person.length == letter_compare
                        player_name += ", #{person}"
                    elsif person.length > letter_compare
                        letter_compare = person.length
                        player_name = person
                    end
                end
            end
                        
        end
    end
    player_name
end


def player_with_most_steals
    steal_compare = 0
    player_name = ""
    
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if attribute == :players
                data.each do |person, person_data|
                    person_data.each do |stat, value|
                        if stat == :steals
                            if value == steal_compare
                                player_name += ", #{person}"
                            elsif value > steal_compare
                                steal_compare = value
                                player_name = person
                            end
                        end
                    end
                end
            end
            
        end
    end
    player_name
    
end


def long_name_steals_a_ton?
    if player_with_longest_name == player_with_most_steals
        true
    end
end

