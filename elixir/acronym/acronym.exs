defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/(?=[A-Z])|\s/)
    |> List.flatten
    |> Enum.map(fn(x) -> String.first(x) |> String.upcase end) 
    |> Enum.join("")
  end
end
