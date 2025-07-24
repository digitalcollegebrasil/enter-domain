
# ![Capa](.github/capa.jpg)

# 🖥️ Script PowerShell: Adicionar Computador ao Domínio `DIGITALCOLLEGE.INTERNAL`

## 📄 Descrição

Este script PowerShell automatiza o processo de adicionar um computador ao domínio **`DIGITALCOLLEGE.INTERNAL`**. Ele usa credenciais fornecidas para autenticação, tenta ingressar a máquina no domínio e reinicia o sistema em caso de sucesso.

---

## 🧩 Requisitos

* Executar com permissões de administrador
* PowerShell 5.1 ou superior
* A máquina deve estar conectada à rede do domínio
* Conta de domínio com permissão para adicionar máquinas

---

## 📁 Estrutura

```
📁 Projeto
├── enterdomain.ps1
└── .github
    └── capa.jpg
```

---

## 💻 Código

```powershell
$domainUsername = ""
$domainPassword = ConvertTo-SecureString "" -AsPlainText -Force
$domainCredential = New-Object System.Management.Automation.PSCredential ($domainUsername, $domainPassword)

$computerName = $env:COMPUTERNAME
$domainName = "DIGITALCOLLEGE.INTERNAL"

try {
    Add-Computer -ComputerName $computerName -DomainName $domainName -Credential $domainCredential -Restart -Force -ErrorAction Stop
    Write-Host "O notebook foi adicionado ao domínio com sucesso."
} catch {
    Write-Host "Falha ao adicionar o notebook ao domínio."
    Write-Host "Erro: $_"
}
```

---

## ⚙️ Parâmetros

| Variável            | Descrição                                                        |
| ------------------- | ---------------------------------------------------------------- |
| `$domainUsername`   | Nome de usuário do domínio (ex: `admin@digitalcollege.internal`) |
| `$domainPassword`   | Senha do domínio convertida para `SecureString`                  |
| `$domainCredential` | Objeto de credencial usado para autenticação                     |
| `$computerName`     | Nome da máquina local                                            |
| `$domainName`       | Nome do domínio a ser ingressado                                 |

---

## 🔐 Segurança

* **⚠️ Nunca deixe as credenciais em branco em ambientes reais.**
* Considere armazenar e recuperar as credenciais com o `Get-Credential` ou arquivos criptografados.

---

## 🚀 Execução

1. Edite o script e preencha o `domainUsername` e `domainPassword`.
2. Execute como administrador:

   ```bash
   powershell -ExecutionPolicy Bypass -File script.ps1
   ```

---

## 🛠️ Resultado Esperado

* Em caso de sucesso:

  ```
  O notebook foi adicionado ao domínio com sucesso.
  ```

  O computador será reiniciado automaticamente.

* Em caso de erro:

  ```
  Falha ao adicionar o notebook ao domínio.
  Erro: <mensagem de erro>
  ```