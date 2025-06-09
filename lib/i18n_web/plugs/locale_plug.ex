defmodule I18nWeb.Plugs.Locale do
  import Plug.Conn

  @locales Gettext.known_locales(I18nWeb.Gettext)

  def init(_opts), do: nil

  def call(%Plug.Conn{params: %{"locale" => locale}} = conn, _opts) when locale in @locales do
    case fetch_locale_from(conn) do
      nil ->
        conn

      locale ->
        I18nWeb.Gettext |> Gettext.put_locale(locale)
        conn |> put_resp_cookie("locale", locale, max_age: 365 * 24 * 60 * 60)
    end
  end

  def call(conn, _opts), do: conn

  defp fetch_locale_from(conn) do
    dbg(conn.cookies)

    (conn.params["locale"] || conn.cookies["locale"])
    |> check_locale()
  end

  defp check_locale(locale) when locale in @locales, do: locale

  defp check_locale(_), do: nil
end
