defmodule Aoc.DayThree do
  def process_chunk({lines, chunk_num}) do
    IO.inspect(lines)
    IO.puts("chunk_num: #{chunk_num}")
    # IO.inspect(chunk_num, "chunk_num")
  end

  def part_one(file) do
    File.stream!(file)
    |> Stream.with_index(1)
    |> Stream.chunk_every(3)
    |> Stream.with_index(1)
    |> Stream.each(&process_chunk/1)
    |> Enum.to_list()
  end

  def part_two(file) do
    # your code here
  end
end
