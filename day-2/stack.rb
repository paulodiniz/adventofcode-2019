class Stack

  SUM = 1
  MUL = 2
  HALT = 99

  attr_accessor :instructions
  attr_accessor :ip

  def initialize(instructions)
    self.instructions = instructions
    self.ip = 0
  end

  def compute
    begin
      process_instruction
      jump_to_next_instruction
    end until current_instruction == HALT

    instructions
  end

  def current_instruction
    instructions[ip]
  end

  def process_instruction
    first_number_position  = instructions[ip + 1]
    second_number_position = instructions[ip + 2]
    result_position        = instructions[ip + 3]

    first_number = instructions[first_number_position]
    second_number = instructions[second_number_position]

    case current_instruction
    when SUM
      result = first_number + second_number
    when MUL
      result = first_number * second_number
    end

    instructions[result_position] = result
  end

  def jump_to_next_instruction
    self.ip += 4
  end
end

NOUNS = (0..99).to_a
VERBS = (0..99).to_a

PROGRAM = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,19,5,23,1,23,6,27,2,9,27,31,1,5,31,35,1,35,10,39,1,39,10,43,2,43,9,47,1,6,47,51,2,51,6,55,1,5,55,59,2,59,10,63,1,9,63,67,1,9,67,71,2,71,6,75,1,5,75,79,1,5,79,83,1,9,83,87,2,87,10,91,2,10,91,95,1,95,9,99,2,99,9,103,2,10,103,107,2,9,107,111,1,111,5,115,1,115,2,119,1,119,6,0,99,2,0,14,0]

NOUNS.product(VERBS).each do |noun, verb|
  new_program = PROGRAM.dup
  new_program[1] = noun
  new_program[2] = verb

  result = Stack.new(new_program).compute[0]
  puts result

  if result == 19690720
    puts "NOUN #{noun}"
    puts "VERB #{verb}"


    puts "#{100*noun + verb}"
    break
  end
end
