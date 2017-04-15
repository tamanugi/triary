defmodule Triary.Diary do
  use Triary.Web, :model

  schema "diaries" do
    field :user_id, :integer
    field :best, :string
    field :worst, :string
    field :try, :string
    field :public_lebel, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :best, :worst, :try, :public_lebel])
    |> validate_required([:user_id, :best, :worst, :try, :public_lebel])
  end
end
