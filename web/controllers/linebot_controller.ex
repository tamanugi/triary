defmodule Triary.LinebotController do
  use Triary.Web, :controller

  alias Triary.Diary
  alias Triary.DiaryState
  alias Triary.StateAgent

  def index(conn, _params) do
    diaries = Repo.all(Diary)
    render(conn, "index.json", diaries: diaries)
  end

  def create(conn, %{"events" => events}) do

    %{"source" => %{"userId" => line_id}, "replyToken" => replyToken } = List.first events

    String.to_atom(line_id)
    |> StateAgent.message(replyToken)

    #changeset = Diary.changeset(%Diary{}, diary_params)

    #case Repo.insert(changeset) do
    #  {:ok, diary} ->
    #    conn
    #    |> put_status(:created)
    #    |> put_resp_header("location", linebot_path(conn, :show, diary))
    #    |> render("show.json", diary: diary)
    #  {:error, changeset} ->
    #    conn
    #    |> put_status(:unprocessable_entity)
    #    |> render(Triary.ChangesetView, "error.json", changeset: changeset)
    #end
    send_resp(conn, :no_content, "")
  end

  def show(conn, %{"id" => id}) do
    diary = Repo.get!(Diary, id)
    render(conn, "show.json", diary: diary)
  end

  def update(conn, %{"id" => id, "diary" => diary_params}) do
    diary = Repo.get!(Diary, id)
    changeset = Diary.changeset(diary, diary_params)

    case Repo.update(changeset) do
      {:ok, diary} ->
        render(conn, "show.json", diary: diary)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Triary.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    diary = Repo.get!(Diary, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(diary)

    send_resp(conn, :no_content, "")
  end
end
