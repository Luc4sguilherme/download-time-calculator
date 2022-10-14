defmodule DownloadTimeCalculatorTest do
  use ExUnit.Case, async: true

  describe "download time" do
    test "should calculate for 100 B in size and 1 b/s in speed" do
      file_size = %{value: 100, unit: "B"}
      download_speed = %{value: 1, unit: "b/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:13:20"
    end

    test "should calculate for 100 B in size and 1 B/s in speed" do
      file_size = %{value: 100, unit: "B"}
      download_speed = %{value: 1, unit: "B/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:01:40"
    end

    test "should calculate for 1 B in size and 1 Mb/s in speed" do
      file_size = %{value: 1, unit: "B"}
      download_speed = %{value: 1, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:00:00"
    end

    test "should calculate for 1 KB in size and 1 Mb/s in speed" do
      file_size = %{value: 1, unit: "KB"}
      download_speed = %{value: 1, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:00:00"
    end

    test "should calculate for 1 MB in size and 1 Mb/s in speed" do
      file_size = %{value: 1, unit: "MB"}
      download_speed = %{value: 1, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:00:08"
    end

    test "should calculate for 1 GB in size and 1 Mb/s in speed" do
      file_size = %{value: 1, unit: "GB"}
      download_speed = %{value: 1, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "02:16:32"
    end

    test "should calculate for 1 B in size and 1 Kb/s in speed" do
      file_size = %{value: 1, unit: "B"}
      download_speed = %{value: 1, unit: "Kb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:00:00"
    end

    test "should calculate for 1 KB in size and 1 Kb/s in speed" do
      file_size = %{value: 1, unit: "KB"}
      download_speed = %{value: 1, unit: "Kb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:00:08"
    end

    test "should calculate for 1 MB in size and 1 Kb/s in speed" do
      file_size = %{value: 1, unit: "MB"}
      download_speed = %{value: 1, unit: "Kb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "02:16:32"
    end

    test "should calculate for 1 GB in size and 1 Kb/s in speed" do
      file_size = %{value: 1, unit: "GB"}
      download_speed = %{value: 1, unit: "Kb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "2330:10:08"
    end

    test "should calculate for 1 GB in size and 10 Kb/s in speed" do
      file_size = %{value: 1, unit: "GB"}
      download_speed = %{value: 10, unit: "Kb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "233:01:00"
    end

    test "should calculate for 1 GB in size and 150 Kb/s in speed" do
      file_size = %{value: 1, unit: "GB"}
      download_speed = %{value: 150, unit: "Kb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "15:32:04"
    end

    test "should calculate for 150 GB in size and 1 Mb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 1, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "341:20:00"
    end

    test "should calculate for 150 GB in size and 10 Mb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 10, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "34:08:00"
    end

    test "should calculate for 15 GB in size and 25 Mb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 25, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "13:39:12"
    end

    test "should calculate for 150 GB in size and 100 Mb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 100, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "03:24:48"
    end

    test "should calculate for 150 GB in size and 200 Mb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 200, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "01:42:24"
    end

    test "should calculate for 150 GB in size and 500 Mb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 500, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:40:57"
    end

    test "should calculate for 150 GB in size and 1 Gb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 1, unit: "Gb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:20:00"
    end

    test "should calculate for 150 GB in size and 2 Gb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 2, unit: "Gb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:10:00"
    end

    test "should calculate for 150 GB in size and 5 Gb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 5, unit: "Gb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:04:00"
    end

    test "should calculate for 150 GB in size and 1 Tb/s in speed" do
      file_size = %{value: 150, unit: "GB"}
      download_speed = %{value: 1, unit: "Tb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:00:01"
    end

    test "should calculate for 1 TB in size and 1 Mb/s in speed" do
      file_size = %{value: 1, unit: "TB"}
      download_speed = %{value: 1, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "2330:10:08"
    end

    test "should calculate for 1 TB in size and 10 Mb/s in speed" do
      file_size = %{value: 1, unit: "TB"}
      download_speed = %{value: 10, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "233:01:00"
    end

    test "should calculate for 1 TB in size and 500 Mb/s in speed" do
      file_size = %{value: 1, unit: "TB"}
      download_speed = %{value: 500, unit: "Mb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "04:39:37"
    end

    test "should calculate for 1 TB in size and 1 Gb/s in speed" do
      file_size = %{value: 1, unit: "TB"}
      download_speed = %{value: 1, unit: "Gb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "02:16:32"
    end

    test "should calculate for 1 TB in size and 1 Tb/s in speed" do
      file_size = %{value: 1, unit: "TB"}
      download_speed = %{value: 1, unit: "Tb/s"}
      assert DownloadTimeCalculator.calculate(file_size, download_speed) == "00:00:08"
    end
  end
end
