defmodule Triary.Repo.Migrations.CreateDiary do
  use Ecto.Migration

  def change do
    create table(:diaries) do
      add :user_id, :integer
      add :best, :string
      add :worst, :string
      add :try, :string
      add :public_lebel, :integer

      timestamps()
    end

  end
end
