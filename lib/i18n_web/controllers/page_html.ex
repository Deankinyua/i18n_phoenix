defmodule I18nWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use I18nWeb, :html

  embed_templates "page_html/*"
end
