require "minitest/autorun"
class Calculator
    def suma (a,b)
        a+b
    end
    def resta (a,b)
        a-b
    end
end

class Test < MiniTest::Test
 
    def setup
        @calc = Calculator.new
    end
    def test_sum_positives
        result = @calc.suma(1,3)
        assert_equal result, 4
    end 

    def test_sum_negatives
        result =@calc.suma(-1,-4)
        assert_equal result, -5
    end
   
end