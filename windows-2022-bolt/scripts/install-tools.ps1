function InstallIfNotExists-Program {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ProgramName
    )
	
    if (-Not (choco list --lo -r -e $ProgramName)) {
	Write-Host "Install $ProgramName"
	choco install $ProgramName
    } else {
	Write-Host "Already installed $ProgramName"
    }
}

choco feature enable -n allowGlobalConfirmation

InstallIfNotExists-Program "git"
InstallIfNotExists-Program "ruby"
InstallIfNotExists-Program "msys2"
