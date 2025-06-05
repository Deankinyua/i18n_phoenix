defmodule I18nWeb.Plugs.Locale do
  import Plug.Conn

  @locales Gettext.known_locales(I18nWeb.Gettext)

  def init(_opts), do: nil

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _opts) when locale in @locales do
    I18nWeb.Gettext |> Gettext.put_locale(locale)
    conn
  end

  def call(conn, _opts), do: conn
end
