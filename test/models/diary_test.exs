defmodule Triary.DiaryTest do
  use Triary.ModelCase

  alias Triary.Diary

  @valid_attrs %{best: "some content", public_lebel: 42, try: "some content", user_id: 42, worst: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Diary.changeset(%Diary{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Diary.changeset(%Diary{}, @invalid_attrs)
    refute changeset.valid?
  end
end
