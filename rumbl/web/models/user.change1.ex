def changeset(mode, params \\ :empty) do
  model
  |> cast(params, ~w(name username), [])
  |> validate_length(:username, min: 1, max: 20)
end
