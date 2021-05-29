require 'rugged'
require 'linguist'

repo = Rugged::Repository.new('.')
project = Linguist::Repository.new(repo, repo.head.target_id)
print(project.language + "\n")

file = File.open("js.txt")
file_data = file.read  
lines = file_data = file.readlines.map(&:chomp)

print(lines)

#https://github.com/ruby-git/ruby-git
