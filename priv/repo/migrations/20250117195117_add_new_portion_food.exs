defmodule TrudyFoodTracker.Repo.Migrations.AddNewPortionFood do
  use Ecto.Migration

  def change do
    alter table(:foods) do
      add :portion_type, :string, null: false, default: "half"
    end

    # execute("""
    #   ALTER TABLE foods
    #   ADD CONSTRAINT portion_type_constraint
    #   CHECK (portion_type IN ('full', 'half', 'quarter'))
    #   """)
  end
end
