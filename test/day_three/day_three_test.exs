defmodule DayThreeTest do
  alias Aoc.DayThree
  use ExUnit.Case

  @fixtures "test/day_three/fixtures/"

  test "successfully passes part one sample" do
    assert DayThree.part_one(@fixtures <> "part_one.txt") == 0
  end

  test "successfully passes part one" do
    assert DayThree.part_one(@fixtures <> "input.txt") == 0
  end

  test "successfully passes part two sample" do
    assert DayThree.part_two(@fixtures <> "part_two.txt") == 0
  end

  test "successfully passes part two" do
    assert DayThree.part_two(@fixtures <> "input.txt") == 0
  end
end
