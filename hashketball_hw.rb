require 'pry' # just pulls in the pry code

# shortcuts!!!!!!!!

# TDD => write your tests for what you want it to do
# then write the code to pass those tests

# CMD + /
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# to get an array of all the players together
# create a new array
# shovel in game_hash[:home][:players] to the new array
# shovel in game_hash[:away][:players] to the new array
# flatten <== another step

# use something like select or find to find the key players
# refactor

# merge the two arrays of players => hash

# iteration where you go from the top to the bottom
# then if what's in your pipe, then do the same thing in
# the first solution
# => iterate through the player
# then shovel them into a new array

# do whatever works!

# Process => ok let me thing in high level steps
# Pseudocode
# new array for all the players
# add in the home players
# add in the away players
# then flatten it

# get the home players and add it to the away players
  # home players
  # Single Responsibility Principle
def all_players
  home_players = game_hash[:home][:players]
    # away players
  away_players = game_hash[:away][:players]
    # then add them ()
  # all_players = home_players.concat(away_players)
  # all_players = home_players + away_players
  home_players + away_players
end

def find_player(player_name)
  all_players.find do |player_hash|
    player_hash[:player_name] == player_name
  end
end
# naming is HARD!!
                      # string
def num_points_scored(player_name)
  # is that the right way?
  # problem solving?
  # iterate through the player names <= we already have all the players
  # all_players.each do |player_hash| # This is a Hash with player data # many iterator methods
  #   # if the player name matches the given arguement
  #   # binding.pry
  #   if player_hash[:player_name] == player_name
  #     # take the score
  #     return player_hash[:points]
  #   end
  # end

  # binding.pry

  # found_player = all_players.find do |player_hash|
  #   player_hash[:player_name] == player_name
  # end
  find_player(player_name)[:points] # the last line is what is returned as your condition

  # binding.pry

    ## each => returns the original array; it can do whatever it wants inside => Array
      # WILL WORK FOR ANYTHING IF YOU ARE CREATIVE ENOUGH
    # find => return the first thing that matches the condition you give it => ???
    ## select => returns all elements that match the condition you give it => Array
    ## map => returns a changed array => Array

  # returns nil when nothing is in it
end

def shoe_size(player_name)
  # pretty much the same steps
  find_player(player_name)[:shoe]
end
# binding.pry

# Homework
# map, select

# 1. give me all the players with assists > 5
# [{}, {}, {}]
def players_with_5_plus_assists
  all_players.select do |player|
    player[:assists] > 5
    end
  end

# 2. give me an array of just the player names
# ["", "", ""]
def on_the_court
  all_players.map { |player| player.first }
end
# 3. Convert each one to an each
def players_with_5_plus_assists_with_each
  good_passers = []
  all_players.each do |player|
      if player[:assists] > 5
        good_passers << player
        end
      end
      good_passers
    end

def on_the_court_each
  court = []
  all_players.each do |player|
    court << player.first
  end
  court
end

binding.pry
