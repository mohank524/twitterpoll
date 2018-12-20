defmodule TwitterPollWeb.PageController do
  use TwitterPollWeb, :controller

  alias TwitterPoll.Poll
  alias TwitterPoll.Poll.Tweet


  def index(username) do
    output = Twittex.Client.user_timeline!(username)
    created_at = Enum.map(output, fn (x) -> x["created_at"] end)
    text = Enum.map(output, fn (x) -> x["text"] end)
    retweet_count = Enum.map( output, fn (x) -> x["retweet_count"] end)
    name = Enum.map(output, fn (x) -> x["user"]["name"] end)
    e = %{retweet_count: Enum.at(retweet_count, 1) , created_at: Enum.at(created_at, 1) , text: Enum.at(text, 1), name: Enum.at(name, 1)}
    TwitterPoll.Poll.create_tweet(e)
  end

  def input_list() do
    for input <- Application.fetch_env!(:twittex, :lists), do: index(input)
  end
end
