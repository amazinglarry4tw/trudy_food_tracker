defmodule TrudyFoodTracker.Foods.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "foods" do
    field :brand, :string
    field :flavor, :string
    field :portion, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:brand, :flavor, :portion])
    |> validate_required([:brand, :flavor, :portion])
  end
end
