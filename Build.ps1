#Requires -version 7

# GitHub Actions workflow commands:
# https://pakstech.com/blog/github-actions-workflow-commands/
# https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions

$ErrorActionPreference = "Stop"
$homeDir = Get-Location

# copy binaries
Write-Host "::group::Copy binaries"
$distDir = (New-Item -Force -ItemType Directory $homeDir/app).FullName
Set-Location $distDir
yarn init --yes
yarn add @devcontainers/cli
Write-Host "::endgroup::"

# package binaries
Write-Host "::group::Package binaries"
7z a -r -mx $homeDir/node-gyp-for-windows.7z $distDir/node_modules/*
Write-Host "::endgroup::"
