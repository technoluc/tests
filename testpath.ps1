#pop-cat-empty.ico
$pcatempty = "https://raw.githubusercontent.com/technoluc/recycle-bin-themes/main/themes/pop-cat/pop-cat-empty.ico"
$pcatemptyoutput = "$env:userprofile\icons\pop-cat-empty.ico"

#pop-cat-full.ico
$pcatfull = "https://raw.githubusercontent.com/technoluc/recycle-bin-themes/main/themes/pop-cat/pop-cat-full.ico"
$pcatfulloutput = "$env:userprofile\icons\pop-cat-full.ico"

Write-Host "Please choose your theme:"
$choice = $(Write-Host "[1]Pop-Cat `n[2]Patrik Star `n[3]Kirby `n[4]Sword Kirby `n[5]Bulbasaul `n[6]Minecraft Chest `n[7]Dachshund `n[9]Default " -ForegroundColor Yellow) + $(Write-Host "Choice: " -NoNewLine; Read-Host)
if ($choice -eq '1' -or $choice -eq '2' -or $choice -eq '3' -or $choice -eq '4' -or $choice -eq '5' -or $choice -eq '6' -or $choice -eq '7' -or $choice -eq '9') {
    Write-Host "You picked" $choice
}
else {
    Write-Host "You picked" $choice 
    Write-Host "Please enter 1, 2, 3, 4, 5, 6, 7 or 9."
}

if ($choice -eq '1') {

    if (-not(Test-Path -Path $pcatemptyoutput -PathType Leaf)) {
        {
            Write-Host "Downloading pop-cat Empty Icon"
            $url = $pcatempty
            Invoke-WebRequest -Uri $url -OutFile ( New-Item -Path "$pcatemptyoutput" -Force )
        }
        else {
            Write-Host "Pop-cat Empty Icon already exists"
        }
    }

    if (-not(Test-Path -Path $pcatfulloutput -PathType Leaf)) {
        {
            Write-Host "Downloading pop-cat Full Icon"
            $url = $pcatfull
            Invoke-WebRequest -Uri $url -OutFile ( New-Item -Path "$pcatfulloutput" -Force )
        }
        else {
            Write-Host "Pop-cat Full Icon already exists"
        }
    }


    Write-Host "Setting Registry"
    Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" -Name "(Default)" -Value "$env:userprofile\icons\pop-cat-empty.ico,0"
    Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" -Name "full" -Value "$env:userprofile\icons\pop-cat-full.ico,0"
    Set-ItemProperty -Path "Registry::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" -Name "empty" -Value "$env:userprofile\icons\pop-cat-empty.ico,0"
}