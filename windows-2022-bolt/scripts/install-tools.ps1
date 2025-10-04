function InstallIfNotExists-Program {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ProgramName
    )
	
    if (-Not (choco list --lo -r -e $ProgamName)) {
	Write-Host "Install $ProgramName"
	choco install $ProgamName
    } else {
	Write-Host "Already installed $ProgramName"
    }
}

choco feature enable -n allowGlobalConfirmation

InstallIfNotExists-Program "git"
InstallIfNotExists-Program "ruby"
InstallIfNotExists-Program "msys2"
