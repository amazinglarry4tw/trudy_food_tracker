defmodule TrudyFoodTracker.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :brand, :string
      add :flavor, :string

      timestamps(type: :utc_datetime)
    end
  end
end
