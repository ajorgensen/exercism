defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence 
    |> String.replace(~r/[!&@%^:$,]/, "", global: true)
    |> String.replace(~r/[_]/, " ", global: true)
    |> String.downcase
    |> String.split(" ")
    |> Enum.filter(fn(x) -> String.length(x) != 0 end)
    |> Enum.reduce(%{}, fn(word, acc) ->
      Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
