defmodule DayOneTest do
  use ExUnit.Case

  @fixtures "test/day_one/fixtures/"

  test "successfully passes part1 sample" do
    assert DayOne.part1(@fixtures <> "part1_sample.txt") == 142
  end

  test "successfully passes part1" do
    assert DayOne.part1(@fixtures <> "input.txt") == 55108
  end

  test "successfully passes part2 sample" do
    assert DayOne.part2(@fixtures <> "part2_sample.txt") == 281
  end

  test "successfully passes part2" do
    assert DayOne.part2(@fixtures <> "input.txt") == 56324
  end
end
