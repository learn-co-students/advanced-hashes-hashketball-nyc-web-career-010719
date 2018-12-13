require 'pry'


def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points =>22,
          :rebounds =>12,
          :assists =>12,
          :steals =>3,
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

  points = ""

  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == player
        points = player_data[:points]
      end
    end
  end

  return points

end


def shoe_size(player)
  shoe_size = ""

  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name, player_data|
      if player_name == player
        shoe_size = player_data[:shoe]
      end
    end
  end

  return shoe_size

end


def team_colors(team)

  colors = []

  if game_hash[:home][:team_name] == team
    colors = game_hash[:home][:colors]
  else
    colors = game_hash[:away][:colors]
  end

  return colors

end

def team_names

  team_names = []

  game_hash.each do |team, team_data|
    team_names.push(team_data[:team_name])
  end

  return team_names
end

def player_numbers(team_name)

  jerseys = []

  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player, stat|
        jerseys << stat[:number]
      end
    end
  end

 return jerseys
end

def player_stats(player)

  stats = {}

  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name, stat|
      if player_name == player
        stats = stat
      end
    end
  end

  return stats

end


def big_shoe_rebounds

  shoe_sizes = []
  player_largest = ""
  num_rebounds = ""

  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name, stat|
      shoe_sizes.push("#{stat[:shoe]}-#{player_name}")
    end
  end

  player_largest = shoe_sizes.sort.last.split("-")[1]

  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name, stat|
      if player_name == player_largest
        num_rebounds = stat[:rebounds]
      end
    end
  end

  return num_rebounds

end
