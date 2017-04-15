defmodule Triary.LinebotController do
  use Triary.Web, :controller

  alias Triary.Linebot

  def index(conn, _params) do
    linebots = Repo.all(Linebot)
    render(conn, "index.json", linebots: linebots)
  end

  def create(conn, %{"linebot" => linebot_params}) do
    IO.puts inspect linebot_params
    changeset = Linebot.changeset(%Linebot{}, linebot_params)

    case Repo.insert(changeset) do
      {:ok, linebot} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", linebot_path(conn, :show, linebot))
        |> render("show.json", linebot: linebot)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Triary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    linebot = Repo.get!(Linebot, id)
    render(conn, "show.json", linebot: linebot)
  end

  def update(conn, %{"id" => id, "linebot" => linebot_params}) do
    linebot = Repo.get!(Linebot, id)
    changeset = Linebot.changeset(linebot, linebot_params)

    case Repo.update(changeset) do
      {:ok, linebot} ->
        render(conn, "show.json", linebot: linebot)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Triary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    linebot = Repo.get!(Linebot, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(linebot)

    send_resp(conn, :no_content, "")
  end
end
