require 'rugged' 
require 'linguist'  
require 'git'

#repo = Rugged::Repository.new('.')
#project = Linguist::Repository.new(repo, repo.head.target_id)
#print(project.language + "\n")

g = Git.open(Dir.pwd)

lines = []
File.foreach("js.txt").with_index do |line|
  lines.append(line)
end

stuff = [g.config('remote.origin.url').delete_prefix("git@github.com:"), 
          "-----------", 
          "Contributors: " + g.config("user.name"), 
          "Commits: " + (g.log.each{|x| x.to_s}).length.to_s,
          "Branch: " + g.branch.to_s
]

i = 0
stuff.each { |item|
  lines[i] = lines[i].chomp + item.chomp
  i += 1
}

lines.each { |line|
  line.chomp!
}

puts(lines)

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



