defmodule Sales do

  use Timex

  def deals do 
    [
      %{id: 1, amount: 1000, closed_at: ~N[2016-11-01 08:10:00]},
      %{id: 2, amount: 1000, closed_at: ~N[2016-11-01 12:20:00]},
      %{id: 3, amount: 1000, closed_at: ~N[2016-11-01 23:30:00]},
      %{id: 4, amount: 1000, closed_at: ~N[2016-11-02 04:40:00]},
      %{id: 5, amount: 1000, closed_at: ~N[2016-11-03 15:50:00]},
      %{id: 6, amount: 1000, closed_at: ~N[2016-11-04 18:51:00]},
      %{id: 7, amount: 1000, closed_at: ~N[2016-11-04 10:02:00]},
      %{id: 8, amount: 1000, closed_at: ~N[2016-11-05 11:14:00]},
      %{id: 9, amount: 1000, closed_at: ~N[2016-11-06 01:43:00]},
      %{id: 10, amount: 1000, closed_at: ~N[2016-11-07 22:23:00]},
      %{id: 11, amount: 1000, closed_at: ~N[2016-11-07 19:25:00]},
      %{id: 12, amount: 1000, closed_at: ~N[2016-11-07 14:59:00]},
      %{id: 13, amount: 1000, closed_at: ~N[2016-11-09 08:18:00]},
      %{id: 14, amount: 1000, closed_at: ~N[2016-11-10 09:35:00]},
      %{id: 15, amount: 1000, closed_at: ~N[2016-11-10 15:41:00]},
      %{id: 16, amount: 1000, closed_at: ~N[2016-11-11 11:58:00]},
      %{id: 17, amount: 1000, closed_at: ~N[2016-11-12 14:23:00]},
      %{id: 18, amount: 1000, closed_at: ~N[2016-11-13 12:40:00]},
      %{id: 19, amount: 1000, closed_at: ~N[2016-11-14 22:50:00]},
      %{id: 20, amount: 1000, closed_at: ~N[2016-11-15 17:28:00]},
      %{id: 21, amount: 1000, closed_at: ~N[2016-11-15 21:49:00]},
      %{id: 22, amount: 1000, closed_at: ~N[2016-11-15 23:29:00]},
      %{id: 23, amount: 1000, closed_at: ~N[2016-11-16 18:24:00]}
    ]
  end

  def list_deals(deals) do
    deals
    |> filter_weekend_deals
    |> group_deals_per_day
    |> calculate_totals
  end

  def filter_weekend_deals(deals) do
    Enum.filter(deals, fn deal -> Date.day_of_week(deal.closed_at) < 6 end)
  end

  def group_deals_per_day(deals) do
    Enum.group_by(deals, fn deal -> Timex.day(deal.closed_at) end)
  end

  def accumulate(sales) do
    Enum.reduce(sales, 0, fn(x, acc) -> acc + x.amount end)
  end

  def calculate_totals(deals) do
    Enum.map(deals, fn sales_day -> 
      {day, sales} = sales_day
      %{day: day, sales: sales, total: accumulate(sales)}
    end)
  end
end
