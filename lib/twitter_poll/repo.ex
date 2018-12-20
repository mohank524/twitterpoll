defmodule TwitterPoll.Repo do
  use Ecto.Repo,
    otp_app: :twitter_poll,
    adapter: Ecto.Adapters.Postgres
end
