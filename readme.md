# Automação de Testes de API com Robot Framework + RequestsLibrary

Este projeto é uma automação de testes de API desenvolvida para a avaliação prática da disciplina de Automação de Testes. O objetivo é demonstrar os benefícios, escalabilidade e facilidade de manutenção ao utilizar o **Robot Framework** integrado à **RequestsLibrary** para validar serviços web.

A API utilizada como referência para os testes foi a [DummyJSON](https://dummyjson.com).

---

## 📸 Apresentação da Ferramenta

### O que é o Robot Framework?
O **Robot Framework** é um framework genérico de automação de testes de código aberto que utiliza uma abordagem baseada em palavras-chave (*keyword-driven*). Ele é construído sobre a linguagem **Python** e destaca-se pela sua sintaxe legível, que se assemelha a uma linguagem natural.

### Por que usar a RequestsLibrary?
A **RequestsLibrary** é uma biblioteca que conecta o Robot Framework com a popular biblioteca `requests` do Python, permitindo enviar requisições HTTP (GET, POST, PUT, DELETE, etc.) de forma simples e intuitiva.

### Vantagens e Benefícios
* **Legibilidade Alta:** Facilita a comunicação entre QAs, desenvolvedores e POs/gestores.
* **Relatórios Nativos Ricos:** Gera automaticamente relatórios em HTML (`log.html` e `report.html`) detalhados sem necessidade de configurações extras.
* **Escalabilidade:** Permite criar palavras-chave reutilizáveis (*keywords*), organizando a suíte de testes de forma limpa.
* **Fácil Integração:** Suporta integração contínua (CI/CD) em pipelines como GitHub Actions, GitLab CI ou Jenkins.

---

## 🧪 Cenários Automatizados

O projeto contempla os seguintes cenários de teste na API DummyJSON:

1. **`Cenario 01: Deve retornar um produto com sucesso (GET)`**
   * **Objetivo:** Consultar os detalhes de um produto e validar a resposta do servidor.
   * **Validações:** 
     * Status Code HTTP (`200 OK`).
     * Presença e valor correto do atributo `title` no corpo da resposta (`Essence Mascara Lash Princess`).

2. **`Cenario 02: Deve realizar login com sucesso (POST)`**
   * **Objetivo:** Simular o fluxo de autenticação de usuário enviando um *payload* com credenciais.
   * **Validações:** 
     * Status Code HTTP (`200 OK`).
     * Presença do atributo `token` no corpo da resposta retornada pela API.

---

## 📁 Estrutura do Projeto

```text
.
├── resources/
│   └── common.resource      # Configurações globais, URLs e Keywords reutilizáveis
├── tests/
│   └── api_tests.robot      # Casos de teste automatizados (GET e POST)
├── results/                 # Diretório onde os relatórios da execução são salvos
├── requirements.txt         # Lista de dependências Python do projeto
└── README.md                # Documentação do projeto
```

---

## 🛠️ Pré-requisitos e Instalação

### 1. Pré-requisitos
Certifique-se de ter instalado em sua máquina:
* **Python** (versão 3.8 ou superior)
* **Git** (para clonar o repositório)

### 2. Passo a Passo de Instalação

1. Clone o repositório para a sua máquina local:
   ```bash
   git clone <URL_DO_SEU_REPOSITORIO_GITHUB>
   cd <NOME_DA_PASTA_DO_PROJETO>
   ```

2. (Opcional) Crie e ative um ambiente virtual Python:
   ```bash
   # No Windows:
   python -m venv venv
   .\venv\Scripts\activate

   # No Linux/macOS:
   python3 -m venv venv
   source venv/bin/activate
   ```

3. Instale as dependências necessárias:
   ```bash
   pip install -r requirements.txt
   ```

---

## 🚀 Como Executar os Testes

Para executar a suíte de testes e salvar automaticamente os resultados na pasta `results`, utilize o comando:

```bash
robot -d results tests/api_tests.robot
```

### Visualizando os Relatórios de Execução
Após a execução, acesse a pasta `results/` e abra qualquer um dos arquivos abaixo no seu navegador web:
* **`log.html`**: Detalhamento passo a passo de cada requisição HTTP enviada, dados trafegados e validações.
* **`report.html`**: Resumo executivo da suíte de testes com total de testes executados, aprovados e reprovados.

---

## 🔄 Integração CI/CD (Escalabilidade)

O projeto foi configurado para ser executado de forma simples em pipelines de Integração Contínua (CI/CD). Por ser baseado em CLI (Interface de Linha de Comando), ele pode ser disparado em um workflow do **GitHub Actions** adicionando as seguintes etapas no pipeline:

1. Instalação do Python.
2. Execução do `pip install -r requirements.txt`.
3. Execução do comando `robot -d results tests/api_tests.robot`.
4. Armazenamento da pasta `results` como artefato da compilação.