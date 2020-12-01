defmodule Vantjerk.Storage.Picture do
  use Ecto.Schema
  use Arc.Ecto.Schema

  import Ecto.Changeset
  alias Vantjerk.Storage.Picture

  schema "pictures" do
    field :image, FileUploader.Image.Type
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Picture{} = picture, attrs) do
    picture
    |> cast(attrs, [:title])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:image])
  end
end
