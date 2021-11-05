<p align="center">
  <br />
  <br />
  <a href="#pré-requisitos"> Pré-requisitos </a> //
  <a href="#setup"> Setup </a> //
  <a href="#up--running"> Up & Running </a> //
  <a href="#scripts"> Scripts </a> //
  <a href="#estrutura"> Estrutura </a> //
 </p>

## Pré-requisitos

- Node `v14.x.x`
- Yarn `v1`

## Setup

Environment variables:

```sh
 cp .env.example .env.local
```

Install node dependencies:

```sh
 yarn
```

## Up & Running

1. Compilar os arquivos ReScript com as depedências:

```sh
  yarn rescript:build
```

3. Executar o mock server json-api:

```sh
 yarn api:start
```

3. Executar o server de dev do `next`:

```sh
 yarn dev
```

## Scripts

| Script            | Descrição                                                     |
| ----------------- | ------------------------------------------------------------- |
| `rescript:watch`  | Executa o compilador do ReScript em `watch mode`              |
| `rescript:build`  | Executa o build do compilador do ReScript                     |
| `rescript:clean`  | Limpa todos os arquivos geradores pelo compilador do ReScript |
| `rescript:format` | Formata todos os arquivos ReScript                            |
| `next:dev`        | Executa o dev server do next                                  |
| `next:build`      | Executa o build do next                                       |
| `prettier`        | Formata os arquivos `.js,.md,.json` usando prettier           |

## Estrutura

```
├── pages
├── static
├── src
   |─── components
   |─── bindings
   |─── lib
   |──- pages
```

| Folder           | Description                                                                                                                      |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| `pages`          | Páginas do next, não é utilizada para implementações, funciona apenas como um link para as páginas geradas pelos arquivos `.res` |
| `src`            | Pasta onde ficam todas as implementações, páginas, componentes, etc utilizando ReScript                                          |
| `src/components` | Pasta onde ficam todos os componentes utilizados pelas páginas e outros componentes da plataforma                                |
| `src/bindings/`  | Pasta onde ficam todos os bindings e modulos que fazem interoperabilidade com outras bibliotecas JS/TS                           |
| `src/lib/`       | Pasta para módulos que são compartilhados entre outros módulos da aplicação                                                      |
| `src/pages/`     | Page components que são renderizados pelas páginas da pasta `pages/` na raíz do projeto.                                         |
