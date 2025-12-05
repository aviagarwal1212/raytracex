defmodule Ray do
  defstruct [:origin, :direction]

  def at(%Ray{} = ray, t) when is_number(t) do
    ray.direction
    |> Vec3.multiply(t)
    |> Vec3.add(ray.origin)
  end

  def color(%Ray{direction: direction}) do
    unit_direction = Vec3.unit_vector(direction)
    a = 0.5 * (unit_direction.y + 1.0)

    Vec3.multiply(1 - a, %Vec3{x: 1.0, y: 1.0, z: 1.0})
    |> Vec3.add(Vec3.multiply(a, %Vec3{x: 0.5, y: 0.7, z: 1.0}))
  end
end
