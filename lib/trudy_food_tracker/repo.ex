defmodule TrudyFoodTracker.Repo do
  use Ecto.Repo,
    otp_app: :trudy_food_tracker,
    adapter: Ecto.Adapters.Postgres
end
