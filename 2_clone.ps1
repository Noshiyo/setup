$personalAccessToken = ''
$organization = ''
$projects = @('Zero', 'One', 'Two', 'Three')

$base64AuthInfo = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalAccessToken)"))
$headers = @{Authorization = ("Basic {0}" -f $base64AuthInfo) }

foreach ( $project in $projects ) {
    $result = Invoke-RestMethod -Uri "https://dev.azure.com/$organization/$project/_apis/git/repositories?api-version=6.0" -Method Get -Headers $headers
    $result.value.name | ForEach-Object {
        git clone ('https://$organization@dev.azure.com/$organization/$project/_git/' + [uri]::EscapeDataString($_)) repositories/$_
    }
}

