if (-Not (Test-Path -Path "~/.ssh/known_hosts")) {
   New-Item --ErrorAction Ignore -Path "~" -Name ".ssh" -ItemType "Directory"

   $response = Invoke-RestMethod -Method Get -Uri "https://api.github.com/meta" -UseBasicParsing
   $sshkeys = $response.ssh_keys
   $sshkeys | ForEach-Object { "github.com $_" } | Out-File -FilePath ~/.ssh/known_hosts -Encoding UTF8
} else {
  Write-Host "There is already an known_hosts file"
}