winget upgrade --accept-package-agreements --all
winget install -e --accept-package-agreements --id Microsoft.VisualStudio.2022.Enterprise --override "--wait --quiet --add Microsoft.VisualStudio.Workload.Data Microsoft.VisualStudio.Workload.NetWeb Microsoft.VisualStudio.Workload.ManagedDesktop --includeRecommended"
winget install -e --accept-package-agreements --id Notepad++.Notepad++
winget install -e --accept-package-agreements --id Postman.Postman
winget install -e --accept-package-agreements --id Microsoft.VisualStudioCode
winget install -e --accept-package-agreements --id Microsoft.SQLServerManagementStudio
winget install -e --accept-package-agreements --id JetBrains.Rider
winget install -e --accept-package-agreements JanDeDobbeleer.OhMyPosh --source winget --scope user --force
winget install -e --accept-package-agreements --id Mozilla.Firefox
winget install -e --accept-package-agreements --id Microsoft.DotNet.SDK.6
winget install -e --accept-package-agreements --id Microsoft.DotNet.SDK.8
winget install -e --accept-package-agreements --id JetBrains.ReSharper
winget install -e --accept-package-agreements --id JetBrains.Toolbox
winget install -e --accept-package-agreements --id WinMerge.WinMerge
winget install -e --accept-package-agreements --id Microsoft.PowerShell

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
oh-my-posh font install meslo
New-Item -Path $PROFILE -Type File -Force
Add-Content -Path $PROFILE -Value "oh-my-posh init pwsh --config $env:USERPROFILE\Documents\Themes\hul10.omp.json | Invoke-Expression | clear"
git clone https://github.com/JanDeDobbeleer/oh-my-posh.git
New-Item -ItemType Directory -Force -Path "$($env:USERPROFILE)\Documents\Themes"
Copy-Item "oh-my-posh\themes\hul10.omp.json" -Destination "$($env:USERPROFILE)\Documents\Themes\hul10.omp.json"
Remove-Item "oh-my-posh" -Recurse -Force
$PROFILE
