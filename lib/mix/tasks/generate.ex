defmodule Mix.Tasks.Generate do
  use Mix.Task

  @aoc_path "lib/aoc"
  @test_path "test"

  @day_template "lib/template/day.eex"
  @test_template "lib/template/test.eex"

  def generate_day(map) do
    rendered = EEx.eval_file(@day_template |> Path.expand(), map |> Map.to_list())
    out_path = Path.expand(@aoc_path <> "/#{Map.fetch!(map, :day)}.ex")
    File.write!(out_path, rendered)
  end

  def generate_test(map) do
    folder_path = @test_path <> "/#{Map.fetch!(map, :day)}"
    File.mkdir_p!(folder_path |> Path.expand())
    rendered = EEx.eval_file(@test_template |> Path.expand(), map |> Map.to_list())
    out_path = Path.expand(folder_path <> "/#{Map.fetch!(map, :day)}_test.exs")
    File.write!(out_path, rendered)
  end

  def generate_fixtures(map) do
    folder_path = @test_path <> "/#{Map.fetch!(map, :day)}"
    fixtures_path = folder_path <> "/fixtures"
    File.mkdir_p(fixtures_path |> Path.expand())
    File.touch!((fixtures_path <> "/input.txt") |> Path.expand())
    File.touch!((fixtures_path <> "/part_one.txt") |> Path.expand())
    File.touch!((fixtures_path <> "/part_two.txt") |> Path.expand())
  end

  def run(args) do
    arg_day = List.first(args)
    day_x = "day_#{arg_day}"

    if File.exists?(@aoc_path <> "/#{day_x}.ex") do
      IO.puts("'#{@aoc_path}/#{day_x}.ex' already exists, exiting...")
      System.halt(0)
    end

    data = %{
      upper_day: String.capitalize(arg_day),
      lower_day: String.downcase(arg_day),
      day: day_x
    }

    IO.puts("Generating #{day_x}.ex ...")
    generate_day(data)
    IO.puts("Generating #{day_x}_test.exs ...")
    generate_test(data)
    IO.puts("Generating fixtures ...")
    generate_fixtures(data)
    IO.puts("Done!")
  end
end
