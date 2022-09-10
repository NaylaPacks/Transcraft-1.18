. .\secrets.ps1

if ($IsLinux) {
    #Lets Check if the user has Curl Installed
    if (-not (test-path "/usr/bin/curl")) { 
        Write-Host "cURL needed to use the ModpackUploader."
        #If Program is NOT installed stop the script
        return
    }
    Set-Alias Curl "curl"
}
elseif ($IsMacOS) {
    #Lets Check if the user has Curl Installed
    if (-not (test-path "/usr/bin/curl")) { 
        Write-Host "cURL needed to use the ModpackUploader."
        #If Program is NOT installed stop the script
        return
    }
    Set-Alias Curl "curl"
}
elseif ($IsWindows) {
    #Lets Check if the user has Curl Installed
    if (test-path "C:\Windows\System32\curl.exe") {
        Set-Alias Curl "C:\Windows\System32\curl.exe"
    }
    elseif (test-path "$env:USERPROFILE/scoop/apps/curl/current/bin/curl.exe") {
        Set-Alias Curl "$env:USERPROFILE/scoop/apps/curl/current/bin/curl.exe"
    }
    else {
        Write-Host "cURL needed to use the ModpackUploader."
        #If Program is NOT installed stop the script
        return 
    }
}

Remove-Item .\versions.json

Curl -H X-Api-Token:$CURSEFORGE_UPLOADAPI_TOKEN https://minecraft.curseforge.com/api/game/versions >> versions.json
