defmodule Triary.StateAgent do

  alias Triary.LinebotApi

  def start_link(name) do
    Agent.start_link(fn -> :worst end, name: name)
  end

  def put(name, new_state) do
    Agent.update(name, fn _ -> new_state end)
  end

  def get(name, line_id) do
    Agent.get(name, fn map -> Map.get(map, line_id) end)
  end

  def message(name, replyToken) do
    unless Process.whereis(name) do
      start_link(name)
    end
    {message, new_state} = case Agent.get(name, fn current_state -> current_state end) do
      :worst -> {"週末何していますか？", :best}
      :best  -> {"忙しいですか？", :try}
      :try   -> {"救ってもらっていいですか？", :worst}
      _      -> {"Error", :worst}
    end

    message
    |> LinebotApi.reply_message(replyToken)

    put(name, new_state)
  end

end
