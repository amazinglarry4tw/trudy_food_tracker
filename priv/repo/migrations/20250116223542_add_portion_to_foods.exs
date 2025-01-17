defmodule TrudyFoodTracker.Repo.Migrations.AddPortionToFoods do
  use Ecto.Migration

  def change do
    alter table(:foods) do
      add :portion, :string
    end
  end
end
