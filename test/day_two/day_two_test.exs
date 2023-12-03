defmodule DayTwoTest do
  alias Aoc.DayTwo
  use ExUnit.Case

  @fixtures "test/day_two/fixtures/"

  test "successfully passes part one sample" do
    assert DayTwo.part_one(@fixtures <> "sample.txt") == 8
  end

  test "successfully passes part one" do
    assert DayTwo.part_one(@fixtures <> "input.txt") == 2776
  end

  test "successfully passes part two sample" do
    assert DayTwo.part_two(@fixtures <> "sample.txt") == 2286
  end

  test "successfully passes part two" do
    assert DayTwo.part_two(@fixtures <> "input.txt") == 68638
  end
end
