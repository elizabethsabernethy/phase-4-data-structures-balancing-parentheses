require_relative './stack'
require 'pry'

def balancing_parentheses(input)
    stack = Stack.new
    input.chars do |value|
        stack.push(value)
    end

    left = 0
    right = 0
    extra = 0
    size = stack.size

    for x in 0..stack.size
        pop = stack.pop
        peek = stack.peek
        if pop == "(" && peek == ")" && x == 0
            extra+=1
        elsif pop == "("
            left+=1
        elsif pop == ")"
            right+=1
        end
    end

    puts right
    puts left
    puts size

    if right > left
        return right - left + extra
    elsif left > right
        return left - right + extra 
    elsif right == left 
        return extra
    end
end

