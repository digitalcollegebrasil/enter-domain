$domainUsername = ""
$domainPassword = ConvertTo-SecureString "" -AsPlainText -Force
$domainCredential = New-Object System.Management.Automation.PSCredential ($domainUsername, $domainPassword)

$computerName = $env:COMPUTERNAME
$domainName = "DIGITALCOLLEGE.LOCAL"

try {
    Add-Computer -ComputerName $computerName -DomainName $domainName -Credential $domainCredential -Restart -Force -ErrorAction Stop
    Write-Host "O notebook foi adicionado ao domínio com sucesso."
} catch {
    Write-Host "Falha ao adicionar o notebook ao domínio."
    Write-Host "Erro: $_"
}

