defmodule Blabber.ErrorViewTest do
  use Blabber.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 401.json" do
    assert render(Blabber.ErrorView, "401.json", []) ==
      %{errors: [%{title: "Unauthorized", code: 401}]}
  end

  test "renders 403.json" do
    assert render(Blabber.ErrorView, "403.json", []) ==
      %{errors: [%{title: "Forbidden", code: 403}]}
  end

  test "renders 404.json" do
    assert render(Blabber.ErrorView, "404.json", []) ==
    %{errors: [%{title: "Page Not Found", code: 404}]}
  end

  test "render 500.json" do
    assert render(Blabber.ErrorView, "500.json", []) ==
    %{errors: [%{title: "Internal Server Error", code: 500}]}
  end

  test "render any other" do
    assert render(Blabber.ErrorView, "505.json", []) ==
    %{errors: [%{title: "Internal Server Error", code: 500}]}
  end
end
