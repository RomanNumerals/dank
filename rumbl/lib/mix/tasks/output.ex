defmodule Mix.Tasks.Output do
  use Mix.Task
  import Ecto.Query
  alias Rumbl.Repo
  alias Rumbl.Video

  @shortdoc "Counts number of videos by each category, and returns them"
  # solution comprehension/result thanks to Choadis & Colelabar

  def run(_) do
    Mix.Task.run("app.start")

    Repo.all(
      from(
        v in Video,
        join: c in assoc(v, :category),
        select: count(v.id)
      )
    )
    |> IO.inspect()
  end
end
