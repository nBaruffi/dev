use context dcic2024
include csv
include data-source

#Problem 1, check if year is leap year through func
fun leap-year-check(year :: Number) -> Boolean:
  doc: "Checks if year is leap year"
  
  
  #conditionals to follow rules of leap year, dividing by 400, then 100, then 4
  if num-modulo(year, 400) == 0:
    true
  else if num-modulo(year, 100) == 0:
    false
  else if num-modulo(year, 4) == 0:
    true
  else:
    false
  end
  
  #Tests 
where:
  leap-year-check(2024) is true
  leap-year-check(2023) is false
end

#Problem 2: Design a function to take seconds and return the next
fun tick(second :: Number) -> Number:
  doc: "take seconds and return next second like a tick"
  
  #conditionals to check validity
  if (second >= 0) and (second < 59):
    second + 1
  else if second == 59:
    0
  else: 
    "Invalid number, must be between 0-59"
  end
  
  #Tests
where: 
  tick(59) is 0
  tick(30) is 31
end

#Problem 3: Rock Paper Scissors
fun rock-paper-scissors(player1 :: String, player2 :: String) -> String:
  doc: "Rock Paper Scissors game"
  
  #conditionals
  if (player1 == player2):
    "Tie"
  else if (player1 == "Rock") and (player2 == "Paper"):
    "Player 2"
  else if (player1 == "Rock") and (player2 == "Scissors"):
    "Player 1"
  else if (player1 == "Paper") and (player2 == "Rock"):
    "Player 1"
  else if (player1 == "Paper") and (player2 == "Scissors"):
    "Player 2"
  else if (player1 == "Scissors") and (player2 == "Paper"):
    "Player 1"
  else if (player1 == "Scissors") and (player2 == "Rock"):
    "Player 2"
  else:
    "Invalid choice"
  end
  
where:
  rock-paper-scissors("Rock", "Rock") is "Tie"
  rock-paper-scissors("Scissors", "Paper") is "Player 1"
  rock-paper-scissors("Banana", "Cutwater") is "Invalid choice"
end

#Problem 4: Planets
planets :: Table = table: planet :: String, distance :: Number
  row: "Mercury", 0.39
  row: "Venus", 0.72
  row: "Earth", 1
  row: "Mars", 1.52
  row: "Jupiter", 5.2
  row: "Saturn", 9.54
  row: "Uranus", 19.2
  row: "Neptune", 30.06
end

#Extract row 3 and assign to var called Mars
mars = planets.row-n(3)

#Extract distance from mars
mars-distance = mars["distance"]

#Problem 5:
something = load-table:
  year :: Number,
  day :: Number,
  month :: String,
  rate :: Number
  
  source: csv-table-file("boe_rates.csv", default-options)
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize rate using num-sanitizer
end

#Check number of rows
something.length()

#Find median rate
median-rate = median(something, "rate") 


#Find mode rate
mode-rate = modes(something, "rate")



#Order rate column in ascending and descending to find min/max

#sorted ascending rates
sorted-rates-asc = order-by(something, "rate", true)

#Descending rates sorted
sorted-rates-desc = order-by(something, "rate", false)