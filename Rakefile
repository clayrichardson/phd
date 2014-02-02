
task :default => :build

task :build do
  sh('docker build -t phabricator ./')
end

task :run do
  sh('docker run -t -p 80:80 -p 443:443 phabricator')
end

task :attach do
  sh('docker attach phabricator')
end

task :interactive do
  sh('docker run -t -p 80:80 -p 443:443 -i phabricator')
end

task :shell do
  sh('docker run -t -p 80:80 -p 443:443 -i phabricator /bin/bash')
end

task :kill do
  sh('docker ps -q | xargs docker kill')
end

