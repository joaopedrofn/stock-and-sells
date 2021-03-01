defmodule StockAndSells.Repo do
  use Ecto.Repo,
    otp_app: :stock_and_sells,
    adapter: Ecto.Adapters.Postgres
end
