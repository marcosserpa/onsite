require 'calculator'

describe Calculator do
  describe '.check_input' do
    context 'given only whitespace' do
      it 'returns an error message' do
        expect{ check_input('', '', '') }.to output("You must provide 2 numbers and an operator, young padawan!\n").to_stdout
      end
    end

    context 'given only one number' do
      it 'returns an error message' do
        expect{ check_input('1', '', '') }.to output("You must provide 2 numbers and an operator, young padawan!\n").to_stdout
      end
    end

    context 'given a non-digit character' do
      it 'returns an error message' do
        expect{ check_input('3', 'a', '') }.to output("You cannot operate non-digit characters, young man. You must provide 2 numbers and an operator!\n").to_stdout
      end
    end

    context 'given 2 non-digit character' do
      it 'returns an error message' do
        expect{ check_input('a', 'b', '') }.to output("You cannot operate non-digit characters, young man. You must provide 2 numbers and an operator!\n").to_stdout
      end
    end

    context 'given no operator' do
      it 'returns an error message' do
        expect{ check_input('55', '2', '') }.to output("You still must provide the operator, young man!\n").to_stdout
      end
    end
  end
end
