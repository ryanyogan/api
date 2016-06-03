defmodule Blabber.Message do
  use Blabber.Web, :model

  schema "messages" do
    field :body, :string
    belongs_to :author, Blabber.User
    belongs_to :room, Blabber.Room

    timestamps
  end

  @required_fields ~w(body author_id room_id)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_length(:body, min: 1)
    |> assoc_constraint(:author) # An author is required
    |> assoc_constraint(:room) # A room is required
  end
end
