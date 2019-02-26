
string_1 = "I am learning Ruby language."
string_2 = "why? Coz it's cool and I like it."

puts "---------------------------------------------------------------"

puts "1.Make string_1 capital case(not uppercase)"
puts "---------------------------------------------------------------"

puts string_1.capitalize

puts "---------------------------------------------------------------"

puts "2.Make string_1 lower case"
puts "---------------------------------------------------------------"

puts string_1.downcase

puts "---------------------------------------------------------------"

puts "3.Change the string_1's each letter's case to opposite case."
puts "---------------------------------------------------------------"

puts string_1.swapcase

puts "---------------------------------------------------------------"


puts "4. Print string_1's characters count"
puts "---------------------------------------------------------------"

puts string_1.size

puts "---------------------------------------------------------------"

puts "5.Check if string_1 contains the word 'ruby'."
puts "---------------------------------------------------------------"

if string_1.include? "Ruby"
   puts "String includes 'Ruby'"
else
   puts "String does not contain the word 'ruby'"
end

puts "---------------------------------------------------------------"

puts "6.Split string_2 by '?'"
puts "---------------------------------------------------------------"

puts string_2.split("?")

puts "---------------------------------------------------------------"

puts "7. Concat string_1 and string_2"
puts "---------------------------------------------------------------"

puts string_1 << string_2

puts "---------------------------------------------------------------"

puts "8. Concatenated string, change from 'I' to 'We' and make the sentence in the capital case."

puts "---------------------------------------------------------------"
string = string_1 << string_2
puts string.gsub('I', 'We').capitalize

puts "---------------------------------------------------------------"

puts "9.Convert string_1 to a symbol"
puts "---------------------------------------------------------------"

puts string_1.to_sym
puts string_1.to_sym.class

puts "---------------------------------------------------------------"
puts "10. Convert `nil` to a) array, b) string and c) float."
puts "---------------------------------------------------------------"
p nil.to_a
p nil.to_s
p nil.to_f

puts "---------------------------------------------------------------"
puts "11.Write a method which tells if the number is even or odd?"
puts "---------------------------------------------------------------"

def even_odd(number)
  if number % 2 == 0
    p "The number  #{number} is Even "
  else
    p "The number #{number} is Odd"
  end
end
puts "Enter the number"
number = gets.strip.to_i
even_odd(number)

puts "---------------------------------------------------------------"
puts "12.Program to Check Vowel or consonant"
puts "---------------------------------------------------------------"

def character_checker(letter)
  if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
    puts "The Alphabet Entered #{letter} is a Vowel"
  else
    puts "The Alphabet Entered #{letter}  is a consonant"
  end
end

puts "Enter any Alphabet"
letter = gets.strip
character_checker(letter)

puts "---------------------------------------------------------------"
puts "13.Fibonacci Series up to n number of terms"
puts "---------------------------------------------------------------"

def fibonacci(num)
  sum = 0
  first = 0
  second =1
  puts first
  puts second
  while sum < num do
    sum = first + second
    puts sum
    first = second
    second = sum
  end
end

puts "enter any number"
num = gets.strip.to_i
fibonacci(num)


puts "---------------------------------------------------------------"
puts "14. Display Prime Numbers Between Two Intervals "
puts "---------------------------------------------------------------"

def prime_number(start,last)
  (start..last).each do |n|
    i = 2
    count = 0
    while i < n
      if n % i == 0
        count += 1
      end
      i += 1
    end
    if count == 0
      puts "#{n}"
    end
  end
end

puts "enter the Intervals"
start = gets.strip.to_i
last = gets.strip.to_i
prime_number(start,last)

