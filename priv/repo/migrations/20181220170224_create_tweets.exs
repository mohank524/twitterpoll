defmodule TwitterPoll.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :retweet_count, :integer
      add :created_at, :string
      add :name, :string
      add :text, :string

      timestamps()
    end

  end
end
