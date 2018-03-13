#Step 1 - break the credit card into it's individual digits.
#Step 2 - Start from the right, double every second digit (i.e digit 2, 4, 6 etc.).
#Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
#Step 4 - Sum the digits.
#Step 5 - If the sum is divisible by 10 it's a valid number. Otherwise it's invalid.

module Luhn
  def self.is_valid?(number) 
    sum = sum_number(number)
    if sum % 10 === 0
      true
    else
      false
    end
  end 

  private 
  
  def self.number_to_array(number)
    number.digits()
  end

  def self.double_odd_digits(number)
    number_to_array(number).map.with_index do |digit, index|
      index % 2 == 1 ? digit * 2 : digit
    end
  end

  def self.subtract_9(number)
    doubled_digits = double_odd_digits(number)
    doubled_digits.map.with_index do |doubled_digit, index|
      doubled_digit >= 10 && index % 2 == 1 ? doubled_digit - 9 : doubled_digit
    end
  end

  def self.sum_number(number)
    subtract_9(number).reduce(:+)
  end
end