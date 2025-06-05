defmodule I18n.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      I18nWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:i18n, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: I18n.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: I18n.Finch},
      # Start a worker by calling: I18n.Worker.start_link(arg)
      # {I18n.Worker, arg},
      # Start to serve requests, typically the last entry
      I18nWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: I18n.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    I18nWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
