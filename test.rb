require 'rugged' 
require 'linguist'  
require 'git'
require 'logger'

#repo = Rugged::Repository.new('.')
#project = Linguist::Repository.new(repo, repo.head.target_id)
#print(project.language + "\n")

working_dir = "/home/emil/dev/gitfetch/"
g = Git.open(working_dir, :log => Logger.new(STDOUT))

lines = File.read("js.txt").split
stuff =  [g.config('remote.origin.url').delete_prefix("git@github.com:") , "-----------", "Contributors:" + g.config("user.name"), g.log]


stuff.each { |item|
  puts(item)
}

#https://github.com/ruby-git/ruby-git
#
##    
#    ████████████████████████     empdo@typeracer
#    ████████████████████████     ---------------
#    ████████████████████████     Contributors: empdo, alvesvaren
#    ████████████████████████     Commits: 163
#    ████████████████████████     Last commit: 21h 
#    ██████████  ████    ████     Braches: main
#    ██████████  ██  ████████     Created: 8/31 - 2020
#    ██████████  ████    ████     About: Half done, shit website with shit code
#    ██████████  ████████  ██
#    ██████████  ██  ████  ██
#    ██████    ██████    ████
#    ████████████████████████



