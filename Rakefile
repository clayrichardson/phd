
task :default => :build

task :build do
  sh('docker build -t phabricator ./')
end

task :run do
  sh('docker run -t phabricator')
end

task :attach do
  sh('docker attach phabricator')
end

task :interactive do
  sh('docker run -t -i phabricator')
end

task :shell do
  sh('docker run -t -i phabricator /bin/bash')
end

