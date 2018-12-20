defmodule TwitterPoll.PollTest do
  use TwitterPoll.DataCase

  alias TwitterPoll.Poll

  describe "tweets" do
    alias TwitterPoll.Poll.Tweet

    @valid_attrs %{created_at: "some created_at", name: "some name", retweet_count: 42, text: "some text"}
    @update_attrs %{created_at: "some updated created_at", name: "some updated name", retweet_count: 43, text: "some updated text"}
    @invalid_attrs %{created_at: nil, name: nil, retweet_count: nil, text: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Poll.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Poll.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Poll.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Poll.create_tweet(@valid_attrs)
      assert tweet.created_at == "some created_at"
      assert tweet.name == "some name"
      assert tweet.retweet_count == 42
      assert tweet.text == "some text"
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Poll.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{} = tweet} = Poll.update_tweet(tweet, @update_attrs)
      assert tweet.created_at == "some updated created_at"
      assert tweet.name == "some updated name"
      assert tweet.retweet_count == 43
      assert tweet.text == "some updated text"
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Poll.update_tweet(tweet, @invalid_attrs)
      assert tweet == Poll.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Poll.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Poll.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Poll.change_tweet(tweet)
    end
  end
end
