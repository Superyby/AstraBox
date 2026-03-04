defmodule Astrabox.Repo do
  use Ecto.Repo,
    otp_app: :astrabox,
    adapter: Ecto.Adapters.MyXQL
end
