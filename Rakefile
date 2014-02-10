
task :default => :build

task :build do
  sh('docker build -t phd ./')
end

task :run do
  sh('docker rm phd; exit 0')
  sh('docker run -d -name phd -t -i phd')
end

task :attach do
  sh('docker attach space_phab')
end

task :interactive do
  sh('docker rm phd; exit 0')
  sh('docker run -name phd -t -i phd')
end

task :shell do
  sh('docker rm phd; exit 0')
  sh('docker run -name phd -t -i phd /bin/bash')
end

task :kill do
  sh('docker ps -q | xargs docker kill')
end

