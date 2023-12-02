defmodule DayOne do
  def join_digits(list) do
    case List.first(list) do
      first ->
        case List.last(list) do
          nil -> first
          last -> first <> last
        end
    end
  end

  def remove_letters(list) do
    Enum.filter(list |> String.graphemes(), fn y ->
      case Integer.parse(y) do
        {_, _} -> true
        :error -> false
      end
    end)
  end

  def part1(file) do
    File.stream!(file)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&remove_letters/1)
    |> Stream.map(&join_digits/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum()
  end

  def part2(file) do
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
    |> Stream.map(fn x -> String.replace(x, primary, fn y -> map[y] end) end)
    |> Stream.map(fn x -> String.replace(x, secondary, fn y -> map[y] end) end)
    |> Stream.map(&remove_letters/1)
    |> Stream.map(&join_digits/1)
    |> Stream.map(&String.to_integer/1)
    |> Enum.sum()
  end
end
