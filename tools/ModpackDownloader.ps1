Set-Location "$PSScriptRoot\.."

. .\settings.ps1

if ($IsLinux) {

    #Lets Check if the user has 7-Zip Installed
    if (-not (test-path "/usr/bin/7z")) { 
        Write-Host "7-Zip needed to use the ModpackUploader."
        #If Program is NOT installed stop the script
        return
    }
    Set-Alias 7Zip "7z"
}
elseif ($IsMacOS) {

    #Lets Check if the user has 7-Zip Installed
    if (-not (test-path "/usr/local/bin/7z")) { 
        Write-Host "7-Zip needed to use the ModpackUploader."
        #If Program is NOT installed stop the script
        return
    }
    Set-Alias 7Zip "7z"
}
elseif ($IsWindows) {
    if (test-path "$env:ProgramFiles\7-Zip\7z.exe") {
        Set-Alias 7Zip "$env:ProgramFiles\7-Zip\7z.exe"
    }
    elseif (test-path "$env:USERPROFILE/scoop/apps/7zip/current/7z.exe") {
        Set-Alias 7Zip "$env:USERPROFILE/scoop/apps/7zip/current/7z.exe"
    }
    else {
        Write-Host "7-Zip needed to use the ModpackUploader."
        #If Program is NOT installed stop the script
        return 
    }
}
function Download-GithubRelease {
    param(
        [parameter(Mandatory = $true)]
        [string]
        $repo,
        [parameter(Mandatory = $true)]
        [string]
        $file
    )

    $releases = "https://api.github.com/repos/$repo/releases"

    Write-Host "Determining latest release of $repo"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $tag = (Invoke-WebRequest -Uri $releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name

    $download = "https://github.com/$repo/releases/download/$tag/$file"

    if ($IsWindows) {
        $name = $file.Split(".")[0]
    }

    Write-Host Dowloading...
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest $download -Out $file

    # Cleaning up target dir
    if ($IsWindows) {
        Remove-Item $name -Recurse -Force -ErrorAction SilentlyContinue
    }
}

function Clear-SleepHost {
    Start-Sleep 2
    Clear-Host
}

#Download the Mod Pack Downloader Tool
if ($IsWindows) {
        if (!(Test-Path ./tools/ModpackDownloader.exe) -or $ENABLE_ALWAYS_UPDATE_APPS) {
        	Write-Host "######################################" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Downloading Modpack Downlaoder..." -ForegroundColor Green
            Write-Host ""
            Write-Host "######################################" -ForegroundColor Cyan
            Write-Host ""
            #Lets remove the existing copy and grab a fresh copy
            Remove-Item ./ModpackDownloader.exe -Recurse -Force -ErrorAction SilentlyContinue
            Download-GithubRelease -repo "UnicorNayla/ModpackDownloader-Next" -file $ModpackDownloaderDLWindows
            New-Item "./tools" -ItemType "directory" -Force -ErrorAction SilentlyContinue
            7Zip e -bd "$ModpackDownloaderDLWindows" "ModpackDownloader.exe"
            Move-Item -Path "ModpackDownloader.exe" -Destination ./tools/ModpackDownloader.exe -ErrorAction SilentlyContinue
            Remove-Item $ModpackDownloaderDLWindows -Force -ErrorAction SilentlyContinue
        }
    }
    if ($IsMacOS) {
        if (!(Test-Path ./tools/ModpackDownloader) -or $ENABLE_ALWAYS_UPDATE_APPS) {
        	Write-Host "######################################" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Downloading Modpack Downlaoder..." -ForegroundColor Green
            Write-Host ""
            Write-Host "######################################" -ForegroundColor Cyan
            Write-Host ""
            #Lets remove the existing copy and grab a fresh copy
            Remove-Item ./ModpackDownloader -Recurse -Force -ErrorAction SilentlyContinue
            Download-GithubRelease -repo "UnicorNayla/ModpackDownloader-Next" -file $ModpackDownloaderDLMac
            New-Item "./tools" -ItemType "directory" -Force -ErrorAction SilentlyContinue
            7Zip e -bd "$ModpackDownloaderDLMac" "ModpackDownloader"
            Move-Item -Path "ModpackDownloader" -Destination ./tools/ModpackDownloader -ErrorAction SilentlyContinue
            #Lets also mark it executable
            chmod +x ./tools/CFExporter
            Remove-Item $ModpackDownloaderDLMac -Force -ErrorAction SilentlyContinue
        }
    }
    elseif ($IsLinux) {
        if (!(Test-Path ./tools/ModpackDownloader) -or $ENABLE_ALWAYS_UPDATE_APPS) {
        	Write-Host "######################################" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Downloading Curse Modpack Downlaoder..." -ForegroundColor Green
            Write-Host ""
            Write-Host "######################################" -ForegroundColor Cyan
            Write-Host ""
            #Lets remove the existing copy and grab a fresh copy
            Remove-Item ./ModpackDownloader -Recurse -Force -ErrorAction SilentlyContinue
            Download-GithubRelease -repo "UnicorNayla/ModpackDownloader-Next" -file ./$ModpackDownloaderDLLinux
            New-Item "./tools" -ItemType "directory" -Force -ErrorAction SilentlyContinue
            7Zip e -bd "$ModpackDownloaderDLLinux" "ModpackDownloader"
            Move-Item -Path "ModpackDownloader" -Destination ./tools/ModpackDownloader -ErrorAction SilentlyContinue
            #Lets also mark it executable
            chmod +x ./tools/CFExporter
            Remove-Item $ModpackDownloaderDLLinux -Force -ErrorAction SilentlyContinue        
        }
    }
    Clear-SleepHost

#Now lets download the mods
Write-Host "######################################" -ForegroundColor Cyan
Write-Host ""
Write-Host "Downloading Mods...                   " -ForegroundColor Green
Write-Host ""
Write-Host "######################################" -ForegroundColor Cyan
if ($IsWindows) {
    ./tools/ModpackDownloader.exe -f mods.json
}

else {
    ./tools/ModpackDownloader -f mods.json
}