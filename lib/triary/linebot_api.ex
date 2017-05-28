defmodule Triary.LinebotApi do

  @endpoint "https://api.line.me/v2/bot"

  def reply_message(text, replyToken) do

    message_object = Map.new
                     |> Map.put(:type, "text")
                     |> Map.put(:text, text)

    payload = Map.new
              |> Map.put(:replyToken, replyToken)
              |> Map.put(:messages, [message_object])
              |> Poison.encode!

    request(@endpoint <> "/message/reply", payload, authorization_header())
  end

  def request(url, payload, headers) do
    HTTPoison.post(url, payload, headers)
    |> process_response
  end

  def process_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}), do: body
  def process_response({_, %HTTPoison.Response{status_code: status_code, body: body}}), do: { status_code, body }

  defp authorization_header do

    token = Application.get_env(:triary, :linebot_token)

    Map.new
    |> Map.put("Content-Type", "application/json")
    |> Map.put("Authorization", "Bearer #{token}") 
  end
end
