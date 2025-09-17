
# Infraestrutura de Qualidade de Código

> **Trabalho de Conclusão de Curso**: Os impactos do uso de Inteligência Artificial no processo de produção de código
> 
> **Curso**: Engenharia de Software
> 
> **Universidade**: Universidade de Brasília - Campus FCTE
> 
> **Autores**: Eric Chagas de Oliveira e Lude Yuri de Castro Ribeiro

Repositório para setup da infraestrutura de análise de qualidade do software Zulip com o Sonarqube.

# Repositório de Infraestrutura de Qualidade de Código

## Visão Geral

Este repositório contém a infraestrutura e as configurações necessárias para realizar análises de qualidade de código **Python** localmente. O ambiente utiliza o **PySonar**, uma ferramenta que integra a análise de código Python com a plataforma SonarQube. O objetivo é identificar:

* **Bugs**: Erros lógicos e falhas que podem causar comportamento inesperado.
* **Vulnerabilidades**: Falhas de segurança que podem ser exploradas.
* **Dívida Técnica**: Complexidade de código e problemas de manutenção.
* **Padrões de Código**: Violações de regras de estilo e boas práticas.

---

## Tecnologias Utilizadas

A infraestrutura é construída com as seguintes tecnologias:

* **Docker e Docker Compose**: Para orquestrar e gerenciar os contêineres do SonarQube e seus serviços dependentes (como o banco de dados).
* **SonarQube**: A plataforma principal para a análise de qualidade de código.
* **PySonar**: Um plugin que estende o SonarScanner para analisar o código Python com mais profundidade, garantindo que as regras de qualidade e segurança sejam aplicadas corretamente.
* **SonarScanner**: A ferramenta de linha de comando que executa a análise em cada repositório de código.
---

## Como Usar

### Pré-requisitos

Certifique-se de ter o **Docker** e o **Docker Compose** instalados em sua máquina.

### 1. Configurar o Ambiente

Crie um arquivo `.env` na raiz do projeto, a partir do `.env.example`, e preencha as variáveis de ambiente necessárias.

```bash
cp .env.example .env
```

Edite o arquivo .env com as configurações do banco de dados local e as credenciais desejadas. Uma sugestão é subir um banco de dados em container.

### 2. Iniciar a Infraestrutura

Para subir os serviços, execute o seguinte comando:

```bash
docker-compose up -d
```
Este comando irá criar e iniciar os contêineres do SonarQube e do banco de dados em segundo plano (-d).

3. Acessar o SonarQube

Após alguns minutos, o SonarQube estará disponível no endereço http://localhost:9000.

- Usuário padrão: admin
- Senha padrão: admin

Mais informações na [documentação oficial](https://docs.sonarsource.com/sonarqube-community-build/try-out-sonarqube/).

# Executando o comando do pysonar no projeto
```bash
pysonar \
  --sonar-host-url=http://localhost:9000 \
  --sonar-token=[token_do_projeto] \
  --sonar-project-key=[nome_do_projeto]
```


- sonar.projectKey: Um identificador único para o seu projeto no SonarQube.
- sonar.sources: O diretório do seu código-fonte.
- sonar.host.url: O endereço da sua instância do SonarQube.
- sonar.login: Um token de autenticação gerado no SonarQube para o seu usuário.
