defmodule Triary.LinebotView do
  use Triary.Web, :view

  def render("index.json", %{linebots: linebots}) do
    %{data: render_many(linebots, Triary.LinebotView, "linebot.json")}
  end

  def render("show.json", %{linebot: linebot}) do
    %{data: render_one(linebot, Triary.LinebotView, "linebot.json")}
  end

  def render("linebot.json", %{linebot: linebot}) do
    %{id: linebot.id,
      title: linebot.title}
  end
end
