# frozen_string_literal: true

users = User.seed(:email,
  { email: 'one@example.com' },
  { email: 'two@example.com' },
  { email: 'three@example.com' }
)

user1 = users.first
user2 = users.second
user3 = users.third

Address.seed(:user_id,
  {
    user_id: user1.id,
    postal_code: 1234567,
    address: 'Somewhere around the world',
  }
)

posts = Post.seed(
  {
    user_id: user1.id,
    title: 'ggrks',
  },
  {
    user_id: user1.id,
    title: 'yagni',
  },
)
post1 = posts.first
post2 = posts.second

Comment.seed(
  {
    user_id: user1.id,
    post_id: post1.id,
    body: 'abcde',
  },
  {
    user_id: user1.id,
    post_id: post1.id,
    body: 'fghij',
  },
  {
    user_id: user2.id,
    post_id: post2.id,
    body: 'klmno',
  },
  {
    user_id: user2.id,
    post_id: post2.id,
    body: 'pqrst',
  },
  {
    user_id: user3.id,
    post_id: post2.id,
    body: 'uvwxy',
  },
  {
    user_id: user3.id,
    post_id: post2.id,
    body: 'zabcd',
  }
)
