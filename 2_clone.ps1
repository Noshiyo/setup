$personalAccessToken = ''
$organization = ''
$projects = @('one', 'two')

$base64AuthInfo = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalAccessToken)"))
$headers = @{Authorization = ("Basic {0}" -f $base64AuthInfo) }

foreach ( $project in $projects ) {
    $result = Invoke-RestMethod -Uri "https://dev.azure.com/$organization/$project/_apis/git/repositories?api-version=6.0" -Method Get -Headers $headers
    
    New-Item -ItemType Directory -Path $project

    foreach ($depot in $result.value.name) {
        git clone ("https://$organization@dev.azure.com/$organization/$project/_git/" + [uri]::EscapeDataString($depot)) "$project\$depot"
    }
}
