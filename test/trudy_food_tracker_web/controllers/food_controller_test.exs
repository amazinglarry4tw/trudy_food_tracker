defmodule TrudyFoodTrackerWeb.FoodControllerTest do
  use TrudyFoodTrackerWeb.ConnCase

  import TrudyFoodTracker.FoodsFixtures

  @create_attrs %{brand: "some brand", flavor: "some flavor"}
  @update_attrs %{brand: "some updated brand", flavor: "some updated flavor"}
  @invalid_attrs %{brand: nil, flavor: nil}

  describe "index" do
    test "lists all foods", %{conn: conn} do
      conn = get(conn, ~p"/foods")
      assert html_response(conn, 200) =~ "Listing Foods"
    end
  end

  describe "new food" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/foods/new")
      assert html_response(conn, 200) =~ "New Food"
    end
  end

  describe "create food" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/foods", food: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/foods/#{id}"

      conn = get(conn, ~p"/foods/#{id}")
      assert html_response(conn, 200) =~ "Food #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/foods", food: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Food"
    end
  end

  describe "edit food" do
    setup [:create_food]

    test "renders form for editing chosen food", %{conn: conn, food: food} do
      conn = get(conn, ~p"/foods/#{food}/edit")
      assert html_response(conn, 200) =~ "Edit Food"
    end
  end

  describe "update food" do
    setup [:create_food]

    test "redirects when data is valid", %{conn: conn, food: food} do
      conn = put(conn, ~p"/foods/#{food}", food: @update_attrs)
      assert redirected_to(conn) == ~p"/foods/#{food}"

      conn = get(conn, ~p"/foods/#{food}")
      assert html_response(conn, 200) =~ "some updated brand"
    end

    test "renders errors when data is invalid", %{conn: conn, food: food} do
      conn = put(conn, ~p"/foods/#{food}", food: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Food"
    end
  end

  describe "delete food" do
    setup [:create_food]

    test "deletes chosen food", %{conn: conn, food: food} do
      conn = delete(conn, ~p"/foods/#{food}")
      assert redirected_to(conn) == ~p"/foods"

      assert_error_sent 404, fn ->
        get(conn, ~p"/foods/#{food}")
      end
    end
  end

  defp create_food(_) do
    food = food_fixture()
    %{food: food}
  end
end
