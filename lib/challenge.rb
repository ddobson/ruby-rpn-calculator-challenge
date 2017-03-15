# frozen_string_literal: true

# calc('1 2 +')

# expect(calc('9 10 * 2 / 6 4 1 - * -')).to eq(27)
# 9 * 10 / 2 - 6 * (4 - 1)

def calc(expr)
  stack = []
  expr.split.each do |val|
    if val.to_i.to_s == val || val.to_f.to_s == val
      stack << val.to_f
    else
      operand_one = stack.pop
      operand_two = stack.pop
      operator = val.to_sym
      result = operand_two.send(operator, operand_one)
      stack.push(result)
    end
  end

  stack[0] || 0
end
