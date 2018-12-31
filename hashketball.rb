def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        :Alan_Anderson => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        :Reggie_Evans => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        :Brook_Lopez => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        :Mason_Plumlee => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        :Jason_Terry => {
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
      :colors => ["Turquoise","Purple"],
      :players => {
        :Jeff_Adrien => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        :Bismak_Biyombo => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        :DeSagna_Diop => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        :Ben_Gordon => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        :Brendan_Haywood => {
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

def num_points_scored(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players[player_name.gsub(/\s+/,"_").to_sym][:points]
end

def shoe_size(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players[player_name.gsub(/\s+/,"_").to_sym][:shoe]
end

def team_colors(team)
  if team == "Brooklyn Nets"
    game_hash[:home][:colors]
  elsif team == "Charlotte Hornets"
    game_hash[:away][:colors]
  end
end

def team_names
  team_names_array = []
  game_hash.each do |location, data_set|
    data_set.each do |attribute, value|
      if attribute == :team_name
        team_names_array << value
      end
    end
  end
  team_names_array
end

def player_numbers(team)
  number_array = []
  if team == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |name, stats|
      stats.each do |stat_type, val|
        if stat_type == :number
          number_array << val
        end
      end
    end
  else
    game_hash[:away][:players].each do |name, stats|
      stats.each do |stat_type, val|
        if stat_type == :number
          number_array << val
        end
      end
    end
  end
  number_array
end

def players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
  all_players
end


def player_stats(player_name)
playerdata = nil
 game_hash.collect do |team, stats|
  stats[:players].collect do |player, data|

    if player == player_name.gsub(/\s+/,"_").to_sym
      playerdata = data
    end
  end
 end
playerdata
end


def big_shoe_rebounds
  player_name = ""
  shoe_size = 0
  game_hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return game_hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end
