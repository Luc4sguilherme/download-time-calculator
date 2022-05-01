defmodule ConvertUnits do
  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "B" and to_unit == "b" do
    %{value: value * 8, unit: "b"}
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "b" and to_unit == "B" do
    %{value: value / 8, unit: "B"}
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "B" do
    case to_unit do
      "kB" -> %{value: value / 1024, unit: "kB"}
      "MB" -> %{value: value / (1024 * 1024), unit: "MB"}
      "GB" -> %{value: value / (1024 * 1024 * 1024), unit: "GB"}
      "TB" -> %{value: value / (1024 * 1024 * 1024 * 1024), unit: "TB"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "kB" do
    case to_unit do
      "B" -> %{value: value * 1024, unit: "B"}
      "MB" -> %{value: value / 1024, unit: "MB"}
      "GB" -> %{value: value / (1024 * 1024), unit: "GB"}
      "TB" -> %{value: value / (1024 * 1024 * 1024), unit: "TB"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "MB" do
    case to_unit do
      "B" -> %{value: value * 1024 * 1024, unit: "B"}
      "kB" -> %{value: value * 1024, unit: "kB"}
      "GB" -> %{value: value / 1024, unit: "GB"}
      "TB" -> %{value: value / (1024 * 1024), unit: "TB"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "GB" do
    case to_unit do
      "B" -> %{value: value * 1024 * 1024 * 1024, unit: "B"}
      "kB" -> %{value: value * 1024 * 1024, unit: "kB"}
      "MB" -> %{value: value * 1024, unit: "MB"}
      "TB" -> %{value: value / 1024, unit: "TB"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "TB" do
    case to_unit do
      "B" -> %{value: value * 1024 * 1024 * 1024 * 1024, unit: "B"}
      "kB" -> %{value: value * 1024 * 1024 * 1024, unit: "kB"}
      "MB" -> %{value: value * 1024 * 1024, unit: "MB"}
      "GB" -> %{value: value * 1024, unit: "GB"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "b" do
    case to_unit do
      "kb" -> %{value: value / 1024, unit: "kb"}
      "Mb" -> %{value: value / (1024 * 1024), unit: "Mb"}
      "Gb" -> %{value: value / (1024 * 1024 * 1024), unit: "Gb"}
      "Tb" -> %{value: value / (1024 * 1024 * 1024 * 1024), unit: "Tb"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "kb" do
    case to_unit do
      "b" -> %{value: value * 1024, unit: "b"}
      "Mb" -> %{value: value / 1024, unit: "Mb"}
      "Gb" -> %{value: value / (1024 * 1024), unit: "Gb"}
      "Tb" -> %{value: value / (1024 * 1024 * 1024), unit: "Tb"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "Mb" do
    case to_unit do
      "b" -> %{value: value * 1024 * 1024, unit: "b"}
      "kb" -> %{value: value * 1024, unit: "kb"}
      "Gb" -> %{value: value / 1024, unit: "Gb"}
      "Tb" -> %{value: value / (1024 * 1024), unit: "Tb"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "Gb" do
    case to_unit do
      "b" -> %{value: value * 1024 * 1024 * 1024, unit: "b"}
      "kb" -> %{value: value * 1024 * 1024, unit: "kb"}
      "Mb" -> %{value: value * 1024, unit: "Mb"}
      "Tb" -> %{value: value / 1024, unit: "Tb"}
    end
  end

  def convert(%{value: value, from_unit: from_unit, to_unit: to_unit}) when from_unit == "Tb" do
    case to_unit do
      "b" -> %{value: value * 1024 * 1024 * 1024 * 1024, unit: "b"}
      "kb" -> %{value: value * 1024 * 1024 * 1024, unit: "kb"}
      "Mb" -> %{value: value * 1024 * 1024, unit: "Mb"}
      "Gb" -> %{value: value * 1024, unit: "Gb"}
    end
  end

  def convert_speed(%{value: value, from_unit: from_unit, to_unit: to_unit}) do
    %{value: value, from_unit: from_unit, to_unit: to_unit}
    |> Map.update(:from_unit, 0, fn unit -> String.replace(unit, "/s", "") end)
    |> Map.update(:to_unit, 0, fn unit -> String.replace(unit, "/s", "") end)
    |> convert()
    |> Map.update(:unit, 0, fn unit -> unit <> "/s" end)
  end
end
