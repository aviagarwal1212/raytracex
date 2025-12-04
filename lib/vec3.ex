defmodule Vec3 do
  defstruct x: 0, y: 0, z: 0

  def vector_length(%Vec3{x: x, y: y, z: z}) do
    :math.sqrt(x * x + y * y + z * z)
  end

  def negate(%Vec3{x: x, y: y, z: z}) do
    %Vec3{x: -x, y: -y, z: -z}
  end

  def add(%Vec3{} = a, %Vec3{} = b) do
    %Vec3{x: a.x + b.x, y: a.y + b.y, z: a.z + b.z}
  end

  def subtract(%Vec3{} = a, %Vec3{} = b) do
    add(a, negate(b))
  end

  def multiply(%Vec3{} = a, %Vec3{} = b) do
    %Vec3{x: a.x * b.x, y: a.y * b.y, z: a.z * b.z}
  end

  def multiply(%Vec3{} = vector, scalar) when is_number(scalar) do
    %Vec3{x: vector.x * scalar, y: vector.y * scalar, z: vector.z * scalar}
  end

  def multiply(scalar, %Vec3{} = vector) when is_number(scalar), do: multiply(vector, scalar)

  def divide(%Vec3{} = vector, scalar) when is_number(scalar), do: multiply(vector, 1 / scalar)

  def dot(%Vec3{} = a, %Vec3{} = b) do
    a.x * b.x + a.y * b.y + a.z * b.z
  end

  def cross(%Vec3{} = a, %Vec3{} = b) do
    %Vec3{x: a.y * b.z - a.z * b.y, y: a.z * b.x - a.x * b.z, z: a.x * b.y - a.y * b.x}
  end

  def unit_vector(%Vec3{} = vector) do
    divide(vector, vector_length(vector))
  end
end
