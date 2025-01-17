defmodule TrudyFoodTrackerWeb.FoodController do
  use TrudyFoodTrackerWeb, :controller

  alias TrudyFoodTracker.Foods
  alias TrudyFoodTracker.Foods.Food

  def index(conn, _params) do
    foods = Foods.list_foods()
    render(conn, :index, foods: foods)
  end

  def new(conn, _params) do
    changeset = Foods.change_food(%Food{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"food" => food_params}) do
    case Foods.create_food(food_params) do
      {:ok, food} ->
        conn
        |> put_flash(:info, "Food created successfully.")
        |> redirect(to: ~p"/foods/#{food}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    case Foods.get_food(id) do
      nil ->
        conn
        |> put_flash(:error, "Food not found.")
        |> redirect(to: ~p"/foods")

      food ->
        render(conn, :show, food: food)
    end
  end

  def edit(conn, %{"id" => id}) do
    food = Foods.get_food!(id)
    changeset = Foods.change_food(food)
    render(conn, :edit, food: food, changeset: changeset)
  end

  def update(conn, %{"id" => id, "food" => food_params}) do
    food = Foods.get_food!(id)

    case Foods.update_food(food, food_params) do
      {:ok, food} ->
        conn
        |> put_flash(:info, "Food updated successfully.")
        |> redirect(to: ~p"/foods/#{food}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, food: food, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    food = Foods.get_food!(id)
    {:ok, _food} = Foods.delete_food(food)

    conn
    |> put_flash(:info, "Food deleted successfully.")
    |> redirect(to: ~p"/foods")
  end
end
