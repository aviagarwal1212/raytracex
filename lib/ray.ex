defmodule Ray do
  defstruct [:origin, :direction]

  def at(%Ray{} = ray, t) when is_number(t) do
    ray.direction
    |> Vec3.multiply(t)
    |> Vec3.add(ray.origin)
  end

  def hit_sphere?(%Ray{origin: origin, direction: direction} = _ray, %Vec3{} = center, radius) do
    oc = Vec3.subtract(center, origin)
    a = Vec3.dot(direction, direction)
    b = -2 * Vec3.dot(direction, oc)
    c = Vec3.dot(oc, oc) - radius * radius

    b * b - 4 * a * c >= 0
  end
end
