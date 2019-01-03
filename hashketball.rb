require 'pry'


def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12, 
          steals: 3,
          blocks: 1,
          slam_dunks: 1 
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, 
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6, 
          steals: 3, 
          blocks: 8,
          slam_dunks: 5 
        }, 
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2, 
          steals: 4, 
          blocks: 11,
          slam_dunks: 1 
        }
      }
    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, 
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7, 
          steals: 7, 
          blocks: 15,
          slam_dunks: 10 
        }, 
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12, 
          steals: 4, 
          blocks: 5,
          slam_dunks: 5 
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2, 
          steals: 1, 
          blocks: 1,
          slam_dunks: 0 
        }, 
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12, 
          steals: 22, 
          blocks: 5,
          slam_dunks: 12 
        }
      }
    }
  }
end

#def good_practices
  #game_hash.each do |location, team_data|
    #binding.pry 
      #team_data.each do |attribute, data|
        #binding.pry
        #data.each do |data_item|
          #binding.pry 
      #end 
    #end 
  #end 
#end
#good_practices

def num_points_scored(player_name)
  player_points = []
  game_hash.each do |location, attribute|
    attribute.each do |player, stats|
      if player == :players
        stats.each do |points, value|
          value.each do |k, v|
            if points == player_name && k == :points 
              player_points << v
            end
          end
        end 
      end 
    end 
  end 
  return player_points[0]
end

def shoe_size(player_name)
  player_shoe = []
  game_hash.each do |location, attribute|
    attribute.each do |player, stats|
      if player == :players
        stats.each do |points, value|
          value.each do |k, v|
            if points == player_name && k == :shoe 
              player_shoe << v
            end
          end
        end 
      end 
    end 
  end 
  return player_shoe[0]
end

def team_colors(team)
  if team == "Charlotte Hornets"
    game_hash[:away][:colors]
  elsif team == "Brooklyn Nets"
    game_hash[:home][:colors]
  else

  end
end

def team_names
  team_array = []
  game_hash.each do |location, attribute|
    attribute.each do |k, v|
      if k == :team_name
        team_array << v 
      end
    end
  end
return team_array  
end

def player_numbers(team)
  jersey_array = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |name, stats|
      stats.each do |k, v|
        if k == :number
          jersey_array << v
        end
      end
    end
  else 
    game_hash[:away][:players].each do |name, stats|
      stats.each do |k, v|
        if k == :number
          jersey_array << v 
        end
      end
    end
  end
  jersey_array
end

def player_stats(player_name)
  game_hash.keys.each do |team|
    if game_hash[team][:players].keys.include?(player_name)
      return game_hash[team][:players][player_name]
    end 
  end 
end

def big_shoe_rebounds
  biggest_shoe = ""
  biggest_shoe_boards = ""
  game_hash.each do |location, attribute|
    attribute.each do |player, stats|
      if player == :players
        stats.each do |name, info|
          info.each do |k, v|
            if k == :shoe
              if biggest_shoe == ""
                biggest_shoe = v
                biggest_shoe_boards = game_hash[location][:players][name][:rebounds]
              elsif v > biggest_shoe
                biggest_shoe = v
                biggest_shoe_boards = game_hash[location][:players][name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  biggest_shoe_boards
end



