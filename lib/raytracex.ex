defmodule Raytracex do
  @moduledoc """
  Documentation for `Raytracex`.
  """

  @image_width 400
  @aspect_ratio 16 / 9

  @image_height floor(@image_width / @aspect_ratio) |> max(1)

  @bound_height @image_height - 1
  @bound_width @image_width - 1

  @doc """
  Generates an image
  """
  def run do
    # Camera
    focal_length = 1.0
    viewport_height = 2.0
    viewport_width = viewport_height * @image_width / @image_height
    camera_center = %Vec3{x: 3, y: 0, z: 0}

    # Calculate vectors across the horizontal and down the vertical viewport edges
    viewport_u = %Vec3{x: viewport_width, y: 0, z: 0}
    viewport_v = %Vec3{x: 0, y: -viewport_width, z: 0}

    # Calculate the horizontal and vertical delta vectors from pixel to pixel
    pixel_delta_u = viewport_u |> Vec3.divide(@image_width)
    pixel_delta_v = viewport_v |> Vec3.divide(@image_height)

    # Calculate location of upper left pixel
    viewport_upper_left =
      camera_center
      |> Vec3.subtract(%Vec3{x: 0, y: 0, z: focal_length})
      |> Vec3.subtract(viewport_u |> Vec3.divide(2))
      |> Vec3.subtract(viewport_v |> Vec3.divide(2))

    pixel100_loc =
      viewport_upper_left
      |> Vec3.add(pixel_delta_u |> Vec3.add(pixel_delta_v) |> Vec3.multiply(0.5))

    IO.puts("P3\n#{@image_width} #{@image_height}\n255")

    for j <- 0..@bound_height do
      IO.puts(:standard_error, "Scanlines remaining: #{@image_height - j}")

      for i <- 0..@bound_width do
        pixel_center =
          pixel100_loc
          |> Vec3.add(Vec3.multiply(i, pixel_delta_u))
          |> Vec3.add(Vec3.multiply(j, pixel_delta_v))

        ray_direction = Vec3.subtract(pixel_center, camera_center)
        ray = %Ray{origin: camera_center, direction: ray_direction}

        ray_color(ray)
        |> Color.write_color()
      end
    end
  end

  def ray_color(%Ray{direction: direction} = ray) do
    if Ray.hit_sphere?(ray, %Vec3{x: 0, y: 0, z: -1}, 0.5) do
      %Vec3{x: 1, y: 0, z: 0}
    else
      unit_direction = Vec3.unit_vector(direction)
      a = 0.5 * (unit_direction.y + 1.0)

      Vec3.multiply(1 - a, %Vec3{x: 1.0, y: 1.0, z: 1.0})
      |> Vec3.add(%Vec3{x: 0.5, y: 0.7, z: 1.0} |> Vec3.multiply(a))
    end
  end
end
