defmodule AstraboxWeb.PageController do
  use AstraboxWeb, :controller

  @doc """
  Health check endpoint: GET /api/health
  Returns the service status and version.
  """
  def health(conn, _params) do
    json(conn, %{
      status: "ok",
      service: "AstraBox",
      version: "0.1.0"
    })
  end

  def ok(conn, _params) do
    json(conn, %{
      status: "ok"
    })
  end
end
