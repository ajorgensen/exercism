defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate(strand)
    validate([nucleotide])

    strand |>
    Enum.reduce(0, fn(num, acc) -> 
     cond do
       nucleotide == num -> acc + 1
       true -> acc
     end
    end)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    validate(strand)

    strand |>
    Enum.reduce(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, fn(curr, acc) ->
      Dict.put(acc, curr, acc[curr] + 1)
    end)
  end

  defp validate(strand) do
    case Regex.match?(~r/[ATGC]+$/, to_string(strand)) || Enum.empty?(strand) do
      true -> true
      false -> raise ArgumentError, message: "Strand can only include ATGC but was #{strand}"
    end
  end
end
