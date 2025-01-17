defmodule TrudyFoodTracker.FoodsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrudyFoodTracker.Foods` context.
  """

  @doc """
  Generate a food.
  """
  def food_fixture(attrs \\ %{}) do
    {:ok, food} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        flavor: "some flavor"
      })
      |> TrudyFoodTracker.Foods.create_food()

    food
  end
end
