defmodule Raytracex do
  @moduledoc """
  Documentation for `Raytracex`.
  """

  @image_width 256
  @image_height 256

  def run do
    IO.puts("P3\n#{@image_width} #{@image_height}\n255")

    for j <- 0..(@image_height - 1) do
      for i <- 0..(@image_width - 1) do
        r = (i / (@image_width - 1)) |> normalize_color()
        g = (j / (@image_height - 1)) |> normalize_color()
        b = 0

        IO.puts("#{r} #{g} #{b}")
      end
    end
  end

  defp normalize_color(value), do: floor(255.99 * value)
end
