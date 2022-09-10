# Settings for the ModpackUploader
# For details/help see: https://github.com/EndangeredNayla/MPTools

# The path to the main modpack folder. (the same folder as the mods folder is in)
# Running the modpack uploader from the main modpack folder: ("$PSScriptRoot" | Resolve-Path)
# Running the modpacker uploader from a subfolder: ("$PSScriptRoot/.." | Resolve-Path)
$INSTANCE_ROOT = ("$PSScriptRoot" | Resolve-Path)

# =====================================================================//
#  CURSEFORGE ACCOUNT SETTINGS
# =====================================================================//

$CURSEFORGE_USER = "EndangeredNayla"

# ProjectID can be found on the modpack's Curseforge Projects page, under "About This Project"
$CURSEFORGE_PROJECT_ID = 490560


#=====================================================================//
#  DEPENDENCIES URL
#=====================================================================//

# File name of the latest https://github.com/Gaz492/CFExporter/releases
$CFExporterDLWindows = "CFExporter-v2.0.8-windows-amd64.zip"
$CFExporterDLLinux = "CFExporter-v2.0.8-linux-amd64.tar.gz"
$CFExporterDLMacIntel = "CFExporter-v2.0.8-darwin-amd64.tar.gz"

# File name of the latest https://github.com/TheRandomLabs/ChangelogGenerator/releases
$ChangelogGeneratorDL = "ChangelogGenerator-2.0.0-pre10.jar"

# File name of the latest https://github.com/EndangeredNayla/ModpackDownloader-Next/releases
$ModpackDownloaderDLWindows = "ModpackDownloader-win32.zip"
$ModpackDownloaderDLLinux =  "ModpackDownloader-linux.zip"
$ModpackDownloaderDLMac = "ModpackDownloader-macOS.zip"

# =====================================================================//
#  MAIN MODPACK SETTINGS
# =====================================================================//

# This is the modpack name as seen in it's CurseForge url: https://www.curseforge.com/minecraft/modpacks/[enigmatica6]
$MODPACK_NAME = "transcraft118"

# Name of the Modpack in the ZIP File
$CLIENT_NAME = "Transcraft"

# Version Of The Modpack
$MODPACK_VERSION = "dev9"

# Last Version Of The Modpack
# Needed For Changelog Parsing
# Should be "$null" if this is the first release
$LAST_MODPACK_VERSION = "dev8"

# Which modloader the modpack uses
# Can be "forge" or "fabric"
# default: "forge"
$MODLOADER = "forge"

# =====================================================================//
#  CHANGELOG SETTINGS
# =====================================================================//

# Changelog Type
# Can be "markdown", "text" or "html"
$CLIENT_CHANGELOG_TYPE = "markdown"

# Changelog
# Must be a single string.
$CLIENT_CHANGELOG = "The Changelog is currently being written."

# =====================================================================//
#  CURSEFORGE PROJECT SETTINGS
# =====================================================================//

# Modpack's Minecraft Version
# @(6756) - is Minecraft 1.12.2
# @(7722) - is Minecraft 1.15.2
# @(8134) - is Minecraft 1.16.4
# @(9008) - is Minecraft 1.18.2
# More can be found by running GetGameVersions
$GAME_VERSION = 9008

# Can be "alpha", "beta" or "release"
$CLIENT_RELEASE_TYPE = "alpha"

#=====================================================================//
#  CLIENT FILE SETTINGS
#=====================================================================//

# All of these are defined in client.json. 
# Sorry for the inconvience.

#=====================================================================//
#  SERVER FILE SETTINGS
#=====================================================================//

# List of Mods to remove for the Server
# In the format @("filename", "filename")
$CLIENT_MODS_TO_REMOVE_FROM_SERVER_FILES = @("CraftPresence-1.18.2-Release-1.8.11-universal.jar", "entityculling-forge-mc1.18-1.5.1.jar", "LegendaryTooltips-1.18.2-1.3.0.jar", "mcwifipnp-1.5.6-1.18.2-forge.jar", "NekosEnchantedBooks-1.18.2-1.7.0.jar", "OptifineCapes-1.18.x-1.1.jar", "randomworldname-2.1.jar", "rebind_narrator-forge-1.18.2-2.0.0.jar", "rubidium-0.5.3a.jar", "rubidium_extras-1.18.2_v1.3.2.jar")

# A continuous line of the folders and files (with extensions) to zip into Server Files.
# Default: @("mods", "config")
$SERVER_CONTENTS_TO_ZIP = @("config", "mods", "kubejs", "scripts")


# =====================================================================//
#  MODULES
# =====================================================================//

# Toggles CurseForge CLIENT Files Generation
# Default: $true
$ENABLE_CURSE_CLIENT_MODULE = $true

# Toggle the modpack uploader on/off
# Setting this to $false will also disable the Server File and Changelog Generator Modules.
# Default: $true
$ENABLE_MODPACK_UPLOADER_CURSE_MODULE = $false

# Toggle server file feature on/off
# Default: $true
$ENABLE_SERVER_FILE_MODULE = $false

# Toggle automatic changelog generator on/off
# This module requires an older modpack manifest zip to be present, 
# $LAST_MODPACK_VERSION must be set, and the manifest naming must be consistent.
# Default: $false
$ENABLE_CHANGELOG_GENERATOR_MODULE = $false

# Toggles the Redwonloadment or Thrid Party Dependencies Every Time you Conpile the Pack
# Default: $false
$ENABLE_ALWAYS_UPDATE_APPS = $false

# Toggles Extra Logging on/off.
# Default: $false
$ENABLE_EXTRA_LOGGING = $false

# Toggles GitHub Changelog Generator integration on/off.
# Requires extensive setup, this is an advanced step.
# See below link for info:
# Default: $false
$ENABLE_GITHUB_CHANGELOG_GENERATOR_MODULE = $false
$GITHUB_NAME = "MyName"
$GITHUB_REPOSITORY = "MyRepo"
$CHANGES_SINCE_VERSION = "1.0.0"

# =====================================================================//
#  ADVANCED
#  Do not change anything unless you
#  know what you are doing!
# =====================================================================//

# Syntax of the CLIENT ZIP File
$CLIENT_ZIP_NAME = "$CLIENT_NAME-$MODPACK_VERSION"

# Syntax of the Previous Versions CLIENT ZIP File
$LAST_MODPACK_ZIP_NAME = "$CLIENT_NAME-$LAST_MODPACK_VERSION"

# Default: "$CLIENT_NAME - $MODPACK_VERSION"
$CLIENT_FILE_DISPLAY_NAME = "$CLIENT_NAME - $MODPACK_VERSION"

# Must be a single string. Use Powershell escaping for new lines etc. New line is `n and indent is `t
# Default: $CLIENT_CHANGELOG
$SERVER_CHANGELOG = $CLIENT_CHANGELOG

# Can be "alpha", "beta" or "release"
# Default: $CLIENT_RELEASE_TYPE
$SERVER_RELEASE_TYPE = $CLIENT_RELEASE_TYPE

# ZIP Name for the Server Files
# This reads the values above and ammends server onto it.
# Default: "$CLIENT_NAME Server $MODPACK_VERSION"
$SERVER_ZIP_NAME = "$CLIENT_NAME`Server-$MODPACK_VERSION"

# Default: $SERVER_FILENAME
$SERVER_FILE_DISPLAY_NAME = "$CLIENT_NAME Server $MODPACK_VERSION"