class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def validate_triangle #couldn't get this to work, took this from Chris
    real_triangle = [(side1 + side2 > side3),
      (side1 + side3 > side2),
      (side2 + side3 > side1)]
    [side1, side2, side3].each do |s|
      real_triangle << false if s <= 0
    end
    raise TriangleError if real_triangle.include?(false)
  end


  def kind
    validate_triangle
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene #took this from spec -> why :
    end
  end

  class TriangleError < StandardError
  end
end
