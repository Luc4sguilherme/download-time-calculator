defmodule ConvertUnits do
  @units %{
    "B" => 0,
    "KB" => 1,
    "MB" => 2,
    "GB" => 3,
    "TB" => 4
  }

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit})
      when from_unit == "B" and to_unit == "b" do
    %{value: value * 8, unit: "b"}
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit})
      when from_unit == "b" and to_unit == "B" do
    %{value: value / 8, unit: "B"}
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) do
    %{
      value: value * (1024 ** @units[String.upcase(from_unit)]) / (1024 ** @units[String.upcase(to_unit)]),
      unit: to_unit
    }
  end

  def convert_speed(%{value: value, from_unit: from_unit, to_unit: to_unit}) do
    %{value: value, from_unit: from_unit, to_unit: to_unit}
    |> Map.update(:from_unit, 0, fn unit -> String.replace(unit, "/s", "") end)
    |> Map.update(:to_unit, 0, fn unit -> String.replace(unit, "/s", "") end)
    |> convert()
    |> Map.update(:unit, 0, fn unit -> unit <> "/s" end)
  end
end
