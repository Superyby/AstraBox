defmodule AstraboxWeb.Router do
  use AstraboxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AstraboxWeb do
    pipe_through :api
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:astrabox, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
