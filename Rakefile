
task :default => :build

task :build do
  sh('docker build -t phabricator ./')
end

task :run do
  sh('docker rm phabricator; exit 0')
  sh('docker run -d -name phabricator -t -i phabricator')
end

task :attach do
  sh('docker attach phabricator')
end

task :interactive do
  sh('docker rm phabricator; exit 0')
  sh('docker run -name phabricator -t -i phabricator')
end

task :shell do
  sh('docker rm phabricator; exit 0')
  sh('docker run -name phabricator -t -i phabricator /bin/bash')
end

task :kill do
  sh('docker ps -q | xargs docker kill')
end

