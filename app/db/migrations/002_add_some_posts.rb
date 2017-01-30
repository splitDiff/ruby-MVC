class AddSomePosts < Sequel::Migration
  def up
    Post.create(
      title: 'What is Lorem Ipsum',
      content: 'Lorem Ipsum is dummy text, dummy.'
    )
    Post.create(
      title: 'Good morning',
      content: 'All I wanna do is boogaloo!'
    )
    Post.create(
      title: 'Who is Billy Shears?',
      content: 'He\'s the greatest!'
    )
  end

  def down 
  end
end
