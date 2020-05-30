class Post
  def initialize(id, thumbnail, num_comments, created_utc, url, title, author)
    @title = title
    @author = author
    @id = id
    @thumbnail = thumbnail
    @num_comments = num_comments
    @created_utc = created_utc
    @url = url
  end
end
