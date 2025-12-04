defmodule Raytracex do
  @moduledoc """
  Documentation for `Raytracex`.
  """

  @image_width 256
  @image_height 256

  @bound_width @image_width - 1
  @bound_height @image_height - 1

  @doc """
  Generates an image
  """
  def run do
    IO.puts("P3\n#{@image_width} #{@image_height}\n255")

    for j <- 0..@bound_height do
      IO.puts(:standard_error, "Scanlines remaining: #{@image_height - j}")

      for i <- 0..@bound_width do
        Color.color(i / @bound_width, j / @bound_height, 0)
        |> Color.write_color()
      end
    end
  end
end
