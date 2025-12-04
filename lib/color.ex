defmodule Color do
  alias Raytracex.Utils

  def color() do
    %Vec3{}
  end

  def color(x, y, z) do
    %Vec3{x: x, y: y, z: z}
  end

  def write_color(%Vec3{x: r, y: g, z: b} = _vector) do
    r_byte = r |> Utils.normalize_color()
    g_byte = g |> Utils.normalize_color()
    b_byte = b |> Utils.normalize_color()

    IO.puts("#{r_byte} #{g_byte} #{b_byte}")
  end
end
