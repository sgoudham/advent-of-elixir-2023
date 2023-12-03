defmodule Aoc.DayOne do
  def join_digits([head | _rest] = list) do
    head <> (List.last(list) || "")
  end

  def remove_letters(list) do
    Enum.filter(String.graphemes(list), &(Integer.parse(&1) != :error))
  end

  def replace_regex(data, pattern, map) do
    String.replace(data, pattern, fn y -> map[y] end)
  end

  def part_one(file) do
    File.stream!(file)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&remove_letters/1)
    |> Stream.map(&join_digits/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part_two(file) do
    primary = ~r/(one|two|three|four|five|six|seven|eight|nine)/i
    secondary = ~r/(ne|wo|hree|our|ive|ix|even|ight|ine)/i

    map = %{
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9",
      "ne" => "1",
      "wo" => "2",
      "hree" => "3",
      "our" => "4",
      "ive" => "5",
      "ix" => "6",
      "even" => "7",
      "ight" => "8",
      "ine" => "9"
    }

    File.stream!(file)
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn x -> replace_regex(x, primary, map) end)
    |> Stream.map(fn x -> replace_regex(x, secondary, map) end)
    |> Stream.map(&remove_letters/1)
    |> Stream.map(&join_digits/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
