require 'pry'

def foods
  {"pie" => "delicious", "broccoli" => "not delicious",
  "carrots" => "not delicious", "apples" => "delicious",
"peanut butter" => "delicious"}
end

def delicious_food
  foods.map do |food, tasty|
  if tasty == "delicious"
    puts food
  end
  end
end

def remove_food
  foods.delete_if { |food, tasty| tasty == "not delicious" }
end

character_names = ["Daenerys Targaryen", "Jon Snow" ,"Arya Stark", "Tyrion Lannister", "Sansa Stark", "Cersei Lannister", "Margaery Tyrell"]

def downcase_all(array_of_strings)
  array_of_strings.each do |one_string|
    one_string.downcase
  end
end

def archer
  {
      "name" => "Sterling Mallory Archer",
      "co-workers"=> ["Lana Kane", "Cyril Figgis", "Cheryl Tunt", "Pam Poovey", "Dr Krieger"],
      "favorite_drink" => "Bloody Mary",
      "Quotes" => ["I swear to god, I had something for this", "Phrasing", "Boop", "Danger Zone", "Read a book", "Do you not?", "Can't or won't?"]
  }
end

def quote
  archer["Quotes"].sample
end

binding.pry
