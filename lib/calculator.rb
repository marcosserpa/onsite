module Calculator
  attr_reader :number_1, :number_2, :operator

  def initialize
    begin
      puts 'Hi pseudo-jedi! Welcome to the Stranger Things Calculator. Enter 2 numbers followed by a basic operator (+, -, *, /), everything separated by a whitespace:'

      input = gets.chomp
      @number_1, @number_2, @operator = input.split
    end until check_input(number_1.to_s, number_2.to_s, operator.to_s)
  end

  def check_input(n1, n2, op)
    begin
      case
      when (n1 && n2).match(/[^\d.]+/) # I know that the logig 'OR' is not so clear to read, but it's cute! :)
        puts 'You cannot operate non-digit characters, young man. You must provide 2 numbers and an operator!'
        return false
      when (n1 && n2).empty? # I know that the logig 'OR' is not so clear to read, but it's cute! :)
        puts 'You must provide 2 numbers and an operator, young padawan!'
        return false
      when op.empty? || !op.gsub(/[\/\+\-\*]/, '').empty?
        puts 'You still must provide the operator, young man!'
        return false
      end
    rescue StandardError => e
      puts 'Sorry! Some error ocurred and was not possible to process the operation. Contact the dumb who code this.'
    end

    true
  end

  def operate
    ('%.3f' % number_1.to_f.send(operator, number_2.to_f)).to_f
  end
end
