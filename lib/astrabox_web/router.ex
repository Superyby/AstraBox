defmodule AstraboxWeb.Router do
  use AstraboxWeb, :router

  # JSON API pipeline
  pipeline :api do
    plug :accepts, ["json"]
  end

  # -----------------------------------------------
  # API Routes
  # -----------------------------------------------
  scope "/api", AstraboxWeb do
    pipe_through :api

    # Health check: GET /api/health
    get "/health", PageController, :health
  end

  # -----------------------------------------------
  # Dev-only routes (mailbox preview)
  # -----------------------------------------------
  if Application.compile_env(:astrabox, :dev_routes) do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
