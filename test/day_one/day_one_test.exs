defmodule DayOneTest do
  alias Aoc.DayOne
  use ExUnit.Case

  @fixtures "test/day_one/fixtures/"

  test "successfully passes part one sample" do
    assert DayOne.part_one(@fixtures <> "part_one.txt") == 142
  end

  test "successfully passes part one" do
    assert DayOne.part_one(@fixtures <> "input.txt") == 55108
  end

  test "successfully passes part two sample" do
    assert DayOne.part_two(@fixtures <> "part_two.txt") == 281
  end

  test "successfully passes part two" do
    assert DayOne.part_two(@fixtures <> "input.txt") == 56324
  end
end
