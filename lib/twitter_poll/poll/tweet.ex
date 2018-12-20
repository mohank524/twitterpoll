defmodule TwitterPoll.Poll.Tweet do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tweets" do
    field :created_at, :string
    field :name, :string
    field :retweet_count, :integer
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:retweet_count, :created_at, :name, :text])
    |> validate_required([:retweet_count, :created_at, :name, :text])
  end
end
