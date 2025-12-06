defmodule Vec3 do
  @moduledoc """
  Models vectors in three-dimensions and provides utility functions for common mathematical operations.
  """
  defstruct x: 0, y: 0, z: 0

  @doc """
  Returns the length of a vector.
  """
  def vector_length(%Vec3{x: x, y: y, z: z}) do
    :math.sqrt(x * x + y * y + z * z)
  end

  @doc """
  Negates the vector.
  """
  def negate(%Vec3{x: x, y: y, z: z}) do
    %Vec3{x: -x, y: -y, z: -z}
  end

  @doc """
  Adds two vectors.
  """
  def add(%Vec3{} = a, %Vec3{} = b) do
    %Vec3{x: a.x + b.x, y: a.y + b.y, z: a.z + b.z}
  end

  @doc """
  Subtracts two vectors.
  """
  def subtract(%Vec3{} = a, %Vec3{} = b) do
    add(a, negate(b))
  end

  @doc """
  Multiplies a vector with a vector or a scalar.
  """
  def multiply(%Vec3{} = a, %Vec3{} = b) do
    %Vec3{x: a.x * b.x, y: a.y * b.y, z: a.z * b.z}
  end

  def multiply(%Vec3{} = vector, scalar) when is_number(scalar) do
    %Vec3{x: vector.x * scalar, y: vector.y * scalar, z: vector.z * scalar}
  end

  def multiply(scalar, %Vec3{} = vector) when is_number(scalar), do: multiply(vector, scalar)

  @doc """
  Divides a vector by a scalar.
  """
  def divide(%Vec3{} = vector, scalar) when is_number(scalar), do: multiply(vector, 1 / scalar)

  @doc """
  Returns the dot product of two vectors.
  """
  def dot(%Vec3{} = a, %Vec3{} = b) do
    a.x * b.x + a.y * b.y + a.z * b.z
  end

  @doc """
  Returns the cross product of two vectors.
  """
  def cross(%Vec3{} = a, %Vec3{} = b) do
    %Vec3{x: a.y * b.z - a.z * b.y, y: a.z * b.x - a.x * b.z, z: a.x * b.y - a.y * b.x}
  end

  @doc """
  Returns the unit vector of a vector.
  """
  def unit_vector(%Vec3{} = vector) do
    divide(vector, vector_length(vector))
  end
end
