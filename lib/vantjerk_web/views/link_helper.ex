defmodule LinkHelper do
  def active_class(path, conn) do
    query_string = cond do
      conn.query_string == "" -> ""
      true -> "?#{conn.query_string}"
    end
    if ("#{conn.request_path}#{query_string}" === path) do "active" else "" end
  end
end
