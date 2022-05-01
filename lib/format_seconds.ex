defmodule FormatSeconds do
  @one_minute 60
  @one_hour 3600

  def to_hh_mm_ss(seconds) when seconds >= @one_hour do
    h =
      seconds
      |> div(@one_hour)
      |> pad_int()

    m =
      seconds
      |> rem(@one_hour)
      |> div(@one_minute)
      |> pad_int()

    s =
      seconds
      |> rem(@one_hour)
      |> rem(@one_minute)
      |> pad_int()

    "#{h}:#{m}:#{s}"
  end

  def to_hh_mm_ss(seconds) do
    m =
      seconds
      |> div(@one_minute)
      |> pad_int()

    s =
      seconds
      |> rem(@one_minute)
      |> pad_int()

    "00:#{m}:#{s}"
  end

  defp pad_int(int, padding \\ 2) do
    int
    |> Integer.to_string()
    |> String.pad_leading(padding, "0")
  end
end
