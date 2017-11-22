def test_block
  if block_given?
    yield(all_user)
  else
    p "dont given block!!!"
  end
end

def all_user
  User.all
end


count = 0

test_block do |num|
  num.each do |user|
    puts "#{user.name} さんです"  
  end

end
