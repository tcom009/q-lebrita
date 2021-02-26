require "byebug"


class Calculator
    def suma (a,b)
        a+b
    end
    def resta (a,b)
        a-b
    end
end


calc= Calculator.new
test_sum= {
    [1,2]=>3,
    [5,6]=>11,
    [100,1]=>101
}

test_res= {
    [2,1]=>1,
    [6,3]=>3,
    [100,1]=>99
}

test_sum.each do |input, expected_result|
    #byebug  
    if !(calc.suma(input[0],input[1])==expected_result)
        raise "Test failed for input #{input}. Expected result #{expected_result}"
    else
        puts "Tests sum ok! result => #{expected_result}"

    end 
end
test_res.each do |input, expected_result|
    #byebug  
    if !(calc.resta(input[0],input[1])==expected_result)
        raise "Test failed for input #{input}. Expected result #{expected_result}"
    else
        puts "Tests res ok! result => #{expected_result}"

    end 
end
