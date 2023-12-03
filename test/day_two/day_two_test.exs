defmodule DayTwoTest do
  alias Aoc.DayTwo
  use ExUnit.Case

  @fixtures "test/day_two/fixtures/"

  test "successfully passes part1 sample" do
    assert DayTwo.part1(@fixtures <> "sample.txt") == 8
  end

  test "successfully passes part1" do
    assert DayTwo.part1(@fixtures <> "input.txt") == 2776
  end

  test "successfully passes part2 sample" do
    assert DayTwo.part2(@fixtures <> "sample.txt") == 2286
  end

  test "successfully passes part2" do
    assert DayTwo.part2(@fixtures <> "input.txt") == 68638
  end
end
