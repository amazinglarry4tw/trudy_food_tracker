# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TrudyFoodTracker.Repo.insert!(%TrudyFoodTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TrudyFoodTracker.Repo
alias TrudyFoodTracker.Foods.Food

seed_time = DateTime.truncate(DateTime.utc_now(), :second)

Repo.insert_all(Food, [
  %{brand: "Sheba", flavor: "Beef", portion_type: "half", inserted_at: seed_time, updated_at: seed_time},
  %{brand: "Sheba", flavor: "Salmon", portion_type: "half", inserted_at: seed_time, updated_at: seed_time},
  %{brand: "Sheba", flavor: "Chicken", portion_type: "half", inserted_at: seed_time, updated_at: seed_time},
  %{brand: "Fancy Feast", flavor: "Beef", portion_type: "half", inserted_at: seed_time, updated_at: seed_time},
  %{brand: "Fancy Feast", flavor: "Salmon", portion_type: "half", inserted_at: seed_time, updated_at: seed_time},
  %{brand: "Fancy Feast", flavor: "Chicken", portion_type: "half", inserted_at: seed_time, updated_at: seed_time}
])
