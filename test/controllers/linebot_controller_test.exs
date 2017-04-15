defmodule Triary.LinebotControllerTest do
  use Triary.ConnCase

  alias Triary.Linebot
  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, linebot_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    linebot = Repo.insert! %Linebot{}
    conn = get conn, linebot_path(conn, :show, linebot)
    assert json_response(conn, 200)["data"] == %{"id" => linebot.id,
      "title" => linebot.title}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, linebot_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, linebot_path(conn, :create), linebot: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Linebot, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, linebot_path(conn, :create), linebot: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    linebot = Repo.insert! %Linebot{}
    conn = put conn, linebot_path(conn, :update, linebot), linebot: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Linebot, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    linebot = Repo.insert! %Linebot{}
    conn = put conn, linebot_path(conn, :update, linebot), linebot: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    linebot = Repo.insert! %Linebot{}
    conn = delete conn, linebot_path(conn, :delete, linebot)
    assert response(conn, 204)
    refute Repo.get(Linebot, linebot.id)
  end
end
