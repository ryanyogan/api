ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Slacker.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Slacker.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Slacker.Repo)

