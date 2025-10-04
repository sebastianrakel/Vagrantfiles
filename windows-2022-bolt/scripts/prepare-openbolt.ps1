$projectPath = "C:\openbolt"

if (-Not (Test-Path -Path $projectPath)) {
   git clone https://github.com/openvoxproject/openbolt.git $projectPath

   cd $projectPath
   bundle install --path vendor

   bundle exec r10k puppetfile install
} else {
  Write-Host "openbolt already cloned to $projectPath"
}
