# README

Demo on Heroku
https://whispering-castle-81716.herokuapp.com/api/v1/post

https://whispering-castle-81716.herokuapp.com/api/v1/post?subreddit=javascript

### Routes

- GET /posts
  Will return the top posts on reddit for a desired subreddit. If no subreddit is passed, it will return node as default
  - Params
    
    subreddit: desired subreddit (?subreddit=reactjs)
