require 'rugged' 
require 'linguist'  
require 'git'
require 'json'

file = File.read('icons.json')
data_hash = JSON.parse(file)

repo = Rugged::Repository.new('.')
project = Linguist::Repository.new(repo, repo.head.target_id)
lang = project.language.downcase

unless data_hash["icons"].to_s.include? lang
  lang = "others"
end

g = Git.open(Dir.pwd)

lines = []
data_hash["icons"][lang].each { |line|
  lines.append(line)
}

stuff = [g.config('remote.origin.url').delete_prefix("git@github.com:").gsub("/", "@"),
          "-----------", 
          "Author: " + g.config("user.name").to_s, 
          "Commits: " + (g.log.each{|x| x.to_s}).length.to_s,
          "Branches: " + g.branch.to_s,
          "Created: " + g.log.first.date.to_s[0, 10],
          "About: i do not know how to get about text"
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



