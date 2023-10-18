#TODO Actually pull the latest version, not a hardcoded one
if (test-path "C:\Program Files\nodejs") {
        write-host("Node installed")
} else {
        write-host("Node not installed")
        write-host("Noding downloading")
        iwr -Uri https://nodejs.org/dist/v18.18.2/node-v18.18.2-x64.msi -OutFile $pwd\node-v18.18.2-x64.msi
        write-host("Node Installing")
        Start-Process "Powershell.exe" -argumentlist "$pwd\node-v18.18.2-x64.msi"
}

if ([System.Environment]::GetEnvironmentVariable("node") -eq "C:\Program Files\nodejs") {
        write-host("node in env")
} else {

        [System.Environment]::SetEnvironmentVariable("node", "C:\Program Files\nodejs")
        write-host("Putting node in env")
        restart-computer -confirm
}

write-host("node version")
node -v
write-host("npm version")
npm -v
