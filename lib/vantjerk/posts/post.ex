defmodule Vantjerk.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string
    field :views, :integer
    field :slug, :string
    field :read_time, :integer
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :views, :slug, :read_time])
    |> validate_required([:title, :body])
    |> title_to_slug
    |> body_to_readtime
    end

  def title_to_slug(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, __MODULE__.slugify(title))
    else
      changeset
    end
  end

  def body_to_readtime(changeset) do
    if body = get_change(changeset, :body) do
      put_change(changeset, :read_time, __MODULE__.calculate_read_time(body))
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

  def calculate_read_time(body) do
    count = String.length(body)
    round(count / 1600)
  end


end
