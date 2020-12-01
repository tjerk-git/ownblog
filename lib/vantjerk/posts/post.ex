defmodule Vantjerk.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Vantjerk.Repo 
  schema "posts" do
    field :body, :string
    field :title, :string
    field :views, :integer
    field :slug, :string
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :views, :slug])
    |> validate_required([:title, :body])
    |> title_to_slug
    end

  def title_to_slug(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, __MODULE__.slugify(title))
    else
      changeset
    end
  end

  def slugify(title) do
    title
    |> String.downcase
    |> String.replace(~r/[^a-z0-9\s-]/, "")
    |> String.replace(~r/(\s|-)+/, "-")
  end


end
