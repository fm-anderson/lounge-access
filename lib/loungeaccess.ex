defmodule Loungeaccess do
  use Application
  alias UUID

  def start(_type, _args) do
    Loungeaccess.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = Enum.random([:Anderson, :Erin, :Bruno])
    status = Enum.random([:Silver, :Gold, :Platinum])
    ticket = UUID.uuid4() |> String.split("-") |> List.first()

    if status === :Silver do
      IO.puts("\nSorry #{name}, #{status} members are not allowed to enter this lounge.\n")
    else
      IO.puts("\nWelcome to the lounge, #{name}.")
      IO.puts("Thank you for being a #{status} member!")
      IO.puts("Ticket: #{ticket}\n")
     end
  end
end
