defmodule I18nWeb.ExampleLive.Index do
  @moduledoc """
  An example liveview.
  """

  use I18nWeb, :live_view

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div class="flex items-center justify-center h-screen">
      <h2 class="text-4xl">{gettext("Hello World")}</h2>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def mount(%{"locale" => locale} = _params, _session, socket) do
    Gettext.put_locale(I18nWeb.Gettext, locale)
    {:ok, socket}
  end
end
