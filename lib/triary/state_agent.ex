defmodule Triary.StateAgent do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def put(line_id, state) do
    Agent.update(__MODULE__, &Map.put(&1, line_id, state))
  end

  def get(line_id) do
    Agent.get(__MODULE__, fn map -> Map.get(map, line_id) end)
  end

  def exists?(line_id) do
    Agent.get(__MODULE__, fn map ->
      IO.puts inspect map
      Map.has_key?(map, line_id)
    end)
  end
end
