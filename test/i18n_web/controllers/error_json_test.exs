defmodule I18nWeb.ErrorJSONTest do
  use I18nWeb.ConnCase, async: true

  test "renders 404" do
    assert I18nWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert I18nWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
