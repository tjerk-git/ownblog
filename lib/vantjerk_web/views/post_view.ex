defmodule VantjerkWeb.PostView do
  use VantjerkWeb, :view

  def markdown(body) do
    body
    |> Earmark.to_html
    |> raw
  end

end
