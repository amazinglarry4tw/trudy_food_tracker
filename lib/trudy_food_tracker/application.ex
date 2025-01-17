defmodule TrudyFoodTracker.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TrudyFoodTrackerWeb.Telemetry,
      TrudyFoodTracker.Repo,
      {DNSCluster, query: Application.get_env(:trudy_food_tracker, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TrudyFoodTracker.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TrudyFoodTracker.Finch},
      # Start a worker by calling: TrudyFoodTracker.Worker.start_link(arg)
      # {TrudyFoodTracker.Worker, arg},
      # Start to serve requests, typically the last entry
      TrudyFoodTrackerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TrudyFoodTracker.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TrudyFoodTrackerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
