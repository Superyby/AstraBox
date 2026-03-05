defmodule AstraboxWeb do
  @moduledoc """
  AstraBox Web entry point.
  
  Use this module in controllers, channels, and other web components:
  
      use AstraboxWeb, :controller
      use AstraboxWeb, :router
      use AstraboxWeb, :channel
      use AstraboxWeb, :verified_routes
  """

  def static_paths, do: ~w(assets fonts images favicon.ico robots.txt)

  def router do
    quote do
      use Phoenix.Router, helpers: false

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, formats: [:json]

      import Plug.Conn

      unquote(verified_routes())
    end
  end

  def verified_routes do
    quote do
      use Phoenix.VerifiedRoutes,
        endpoint: AstraboxWeb.Endpoint,
        router: AstraboxWeb.Router,
        statics: AstraboxWeb.static_paths()
    end
  end

  @doc """
  Dispatch to the appropriate module when used.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
