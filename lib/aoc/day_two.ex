defmodule Aoc.DayTwo do
  # Convert to parser combinator later for fun

  @initial_cubes %{possible: :yes, red: 12, green: 13, blue: 14}
  @fewest_cubes %{red: 0, green: 0, blue: 0}

  defp update_cubes({cubes, colour}, acc) do
    new_cubes = Map.fetch!(acc, colour) - cubes

    cond do
      new_cubes < 0 ->
        updated = Map.replace!(acc, :possible, :no)
        Map.update!(updated, colour, &(&1 - cubes))

      true ->
        Map.update!(acc, colour, &(&1 - cubes))
    end
  end

  def parse_set(game) do
    String.split(game, ",", trim: true)
    |> Enum.map(&String.split(&1, " ", parts: 2, trim: true))
    |> Enum.map(fn [cubes, colour] ->
      {String.to_integer(cubes), String.to_existing_atom(colour)}
    end)
  end

  def convert_line_to_game(line) do
    [ids, sets] = String.split(line, ":", parts: 2, trim: true)
    [_, id] = String.split(ids, " ", parts: 2, trim: true)

    game =
      sets
      |> String.split(";", trim: true)
      |> Enum.map(&parse_set/1)

    {id, game}
  end

  def process_game_part1({id, game}, acc) do
    sets =
      game
      |> Enum.map(fn sets ->
        Enum.reduce(sets, @initial_cubes, &update_cubes/2)
      end)

    if Enum.all?(sets, fn set -> Map.get(set, :possible) == :yes end) do
      acc + String.to_integer(id)
    else
      acc
    end
  end

  def part1(file) do
    File.stream!(file)
    |> Stream.map(&String.trim/1)
    |> Enum.map(&convert_line_to_game/1)
    |> Enum.reduce(0, &process_game_part1/2)
  end

  def process_game_part2({_, game}) do
    min_cubes =
      Enum.reduce(Enum.concat(game), @fewest_cubes, fn {cubes, colour}, acc ->
        val = max(Map.fetch!(acc, colour), cubes)
        Map.replace!(acc, colour, val)
      end)

    Enum.reduce(Map.values(min_cubes), fn x, acc -> x * acc end)
  end

  def part2(file) do
    File.stream!(file)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&convert_line_to_game/1)
    |> Enum.map(&process_game_part2/1)
    |> Enum.sum()
  end
end
