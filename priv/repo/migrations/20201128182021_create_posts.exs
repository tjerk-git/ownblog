defmodule Vantjerk.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :views, :integer
      add :slug, :text
      add :read_time, :integer
      timestamps()
    end

  end
end
