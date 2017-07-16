# Sales

A simple sales module as an exercise to improve my elixir skills.

## Assignment:

Create an Elixir utility function that accepts sales deals as input, and calculates the totals for each day as an output.

1) Group deals per day (using the `closed_at` value) 
2) Calculate total amount sold for each day (using the `amount` value) 
3) Exclude sale deals closed on weekends

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sales` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:sales, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sales](https://hexdocs.pm/sales).

