class Api::V1::PostsController < ApplicationController
  # Get Posts
  def index
    subreddit = params["subreddit"] ? params["subreddit"] : DEFAULT_SUBREDDIT
    data = fetch_posts(subreddit)
    render json: format_posts(data)
  end

  def fetch_posts(subreddit)
    request_api(
      "https://www.reddit.com/r/#{subreddit}/top.json?limit=50"
    )
  end

  def format_posts(data)
    posts = []
    for post in data
      posts.push(generate_post_object(post["data"]))
    end
    return posts
  end

  private

  def generate_post_object(post)
    return Post.new(
             post["id"],
             post["thumbnail"],
             post["num_comments"],
             post["created_utc"],
             post["url"],
             post["title"],
             post["author"]
           )
  end

  private

  def request_api(url)
    response = Excon.get(
      url
    )
    return nil if response.status != 200

    parsedResponse = JSON.parse(response.body)
    return parsedResponse["data"]["children"]
  end
end
