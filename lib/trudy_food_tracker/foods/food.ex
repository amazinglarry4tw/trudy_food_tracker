defmodule TrudyFoodTracker.Foods.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "foods" do
    field :brand, :string
    field :flavor, :string
    field :portion_type, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:brand, :flavor, :portion_type])
    |> validate_required([:brand, :flavor, :portion_type])
  end
end
