defmodule Vantjerk.Repo do
  use Ecto.Repo,
    otp_app: :vantjerk,
    adapter: Ecto.Adapters.Postgres
end
