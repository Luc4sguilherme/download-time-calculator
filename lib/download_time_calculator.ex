defmodule DownloadTimeCalculator do
  use Application

  import ConvertUnits
  import FormatSeconds

  def start(_, _) do
    run()
    {:ok, self()}
  end

  defp run() do
    IO.puts("Calculate download time")

    {file_size_value, file_size_unit} =
      IO.gets("Enter the file size (10 GB): ") |> parse_input() |> valid_input("size")

    {download_speed_value, download_speed_unit} =
      IO.gets("Enter the download speed (100 Mb/s): ") |> parse_input() |> valid_input("speed")

    time =
      calculate(
        %{value: file_size_value, unit: file_size_unit},
        %{value: download_speed_value, unit: download_speed_unit}
      )

    IO.puts("Download time is: #{time}")
  end

  defp valid_input({_number, unit} = input, type) do
    regex =
      case type do
        "size" -> ~r/(k|M|G|T)(B)(\/s)?/
        "speed" -> ~r/(k|M|G|T)(b)(\/s)?/
      end

    cond do
      unit =~ regex ->
        input

      true ->
        IO.puts("Invalid unit!")
        run()
    end
  end

  defp parse_input(:error) do
    IO.puts("Invalid input!")
    run()
  end

  defp parse_input({number, unit}) do
    {number, unit |> String.replace("\n", "") |> String.trim()}
  end

  defp parse_input(data) do
    data
    |> Integer.parse()
    |> parse_input()
  end

  defp calculate(file_size, download_speed) do
    %{value: file_size_value, unit: file_size_unit} = file_size
    %{value: download_speed_value, unit: download_speed_unit} = download_speed

    %{value: file_size_bytes} =
      convert(%{value: file_size_value, from_unit: file_size_unit, to_unit: "B"})

    %{value: download_speed_bits} =
      convert_speed(%{value: download_speed_value, from_unit: download_speed_unit, to_unit: "b/s"})

    %{value: download_speed_bytes} =
      convert_speed(%{value: download_speed_bits, from_unit: "b/s", to_unit: "B/s"})

    trunc(file_size_bytes / download_speed_bytes) |> to_hh_mm_ss()
  end
end
