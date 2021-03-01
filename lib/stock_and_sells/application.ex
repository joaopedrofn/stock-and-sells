defmodule StockAndSells.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      StockAndSells.Repo,
      # Start the Telemetry supervisor
      StockAndSellsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: StockAndSells.PubSub},
      # Start the Endpoint (http/https)
      StockAndSellsWeb.Endpoint
      # Start a worker by calling: StockAndSells.Worker.start_link(arg)
      # {StockAndSells.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StockAndSells.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    StockAndSellsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
