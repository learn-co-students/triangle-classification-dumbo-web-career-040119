class Triangle
  attr_accessor :first_side, :second_side, :third_side

  def initialize(first_side, second_side, third_side)
    @first_side = first_side
    @second_side = second_side
    @third_side = third_side
  end

  def kind
    validate_triangle
    if first_side == second_side && second_side == third_side
      :equilateral
    elsif first_side == second_side || second_side == third_side || third_side == first_side
      :isosceles
    else
      :scalene
    end
  end


  def validate_triangle
    real_triangle = [(first_side + second_side > third_side),
      (first_side + third_side > second_side),
      (second_side + third_side > first_side)]
    [first_side, second_side, third_side].each do |s|
      real_triangle << false if s <= 0
    end
    raise TriangleError if real_triangle.include?(false)
  end


  class TriangleError < StandardError
  end
end
