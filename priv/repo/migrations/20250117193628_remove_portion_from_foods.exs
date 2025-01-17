defmodule TrudyFoodTracker.Repo.Migrations.RemovePortionFromFoods do
  use Ecto.Migration

  def change do
    alter table(:foods) do
      remove :portion, :string
    end
  end
end
