**Adicionar Computador ao Domínio - PowerShell Script**

Este script PowerShell permite adicionar um computador ao domínio da Digital College de forma automatizada. Ele é útil em ambientes corporativos onde é necessário integrar novos dispositivos à infraestrutura de rede existente.

### Requisitos

- PowerShell instalado no computador local.
- Permissões de administrador no computador local para adicionar o dispositivo ao domínio.
- Credenciais válidas de administrador de domínio para autenticar a adição ao domínio.
- Estar conectado na rede do acadêmico (Digital College - Acadêmico) ou do administrativo (Digital College - Administrativo)

### Como Usar

1. Abra o Bloco de Notas ou qualquer editor de texto de sua preferência.
2. Cole o código do script PowerShell fornecido neste documento.
3. Edite as variáveis `$domainUsername`, `$domainPassword` e `$domainName` com suas informações específicas de domínio.
4. Salve o arquivo com a extensão ".ps1", por exemplo, "aldeota.ps1".
5. Abra o PowerShell como administrador.
6. Navegue até o diretório onde você salvou o script usando o comando `cd` (Change Directory).
7. Execute o script digitando `.\aldeota.ps1` ou `.\sul.ps1` e pressione Enter.

### Detalhes do Script

- O script começa definindo as credenciais necessárias para autenticar no domínio especificado.
- Em seguida, ele obtém o nome do computador local.
- Depois, define o nome do domínio ao qual o computador será adicionado.
- O script tenta adicionar o computador ao domínio usando as informações fornecidas.
- Se a operação for bem-sucedida, uma mensagem de sucesso será exibida.
- Caso contrário, uma mensagem de falha será exibida, juntamente com detalhes sobre o erro que ocorreu.

### Aviso

- Certifique-se de revisar e entender o script antes de executá-lo.
- Certifique-se de ter permissões adequadas para adicionar o computador ao domínio.
- Mantenha as credenciais de domínio seguras e não compartilhe-as em texto claro.

### Exemplo

```powershell
# Definir as credenciais para autenticar no domínio
$domainUsername = "LOGINDOALUNO"
$domainPassword = ConvertTo-SecureString "Senha" -AsPlainText -Force
$domainCredential = New-Object System.Management.Automation.PSCredential ($domainUsername, $domainPassword)

# Obter o nome do computador local
$computerName = $env:COMPUTERNAME

# Definir o nome do domínio
$domainName = "DIGITALCOLLEGE.LOCAL"

# Tentar adicionar o computador ao domínio
try {
    Add-Computer -ComputerName $computerName -DomainName $domainName -Credential $domainCredential -Restart -Force -ErrorAction Stop
    Write-Host "O computador foi adicionado ao domínio com sucesso."
} catch {
    Write-Host "Falha ao adicionar o computador ao domínio."
    Write-Host "Erro: $_"
}
```