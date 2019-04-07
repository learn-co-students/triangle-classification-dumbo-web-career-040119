class Triangle
  # write code here
  attr_accessor :s1, :s2, :s3
  
  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end
  
  def kind 
    valid
    if s1 == s2 && s2 == s3 && s1 > 0
      :equilateral
    elsif (s1 == s2 || s2 == s3 ||
     s1 == s3) && (s1 > 0 && s2 > 0 && s3 > 0)
      :isosceles
    elsif (s1 != s2 && s2 != s3 &&
     s1 != s3) && (s1 > 0 && s2 > 0 && s3 > 0)
      :scalene
    else
      TriangleError
    end
  end

  def valid 
    real = [(s1 + s2 > s3), (s3 + s2 > s1), (s1 + s3 > s2)]
  [s1, s2, s3].each {|s| real << false if s<=0  }
  raise TriangleError if real.include?(false)
  end


class TriangleError < StandardError
    # triangle error code
  end


end
