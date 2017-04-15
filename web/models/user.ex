defmodule Triary.User do
  use Triary.Web, :model

  schema "users" do
    field :line_id, :string
    field :access_token, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:line_id, :access_token])
    |> validate_required([:line_id, :access_token])
  end
end
