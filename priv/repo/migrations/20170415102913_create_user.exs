defmodule Triary.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :line_id, :string
      add :access_token, :string

      timestamps()
    end

  end
end
