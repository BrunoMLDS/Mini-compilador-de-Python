# myproject

Este projeto consiste no desenvolvimento de um Mini Compilador para a linguagem Python3 utilizando a ferramenta **ANTLR4**. O projeto foi divido em múltiplas fases, cobrindo desde a análise léxica (Lexer) até à análise sintática avançada (Parser), incluindo o suporte a expressões aritméticas, estruturas condicionais, loops aninhados, definição/chamada de funções e tipos de dados estruturados.

---

## 👥 Elementos do Grupo

* **Bruno Santos** - 2024107254
* **Gonçalo Oliveira** - 2024107840

---

## 🚀 Funcionalidades Implementadas

* **Análise Léxica (`PythonLexer.g4`):** Reconhecimento de palavras-chave, identificadores, operadores aritméticos/lógicos, números, strings e controlo estrutural de quebras de linha.
* **Análise Sintática (`PythonParser.g4`):**
    * Expressões matemáticas e atribuição de variáveis.
    * Estruturas condicionais completas (`if`, `elif`, `else`).
    * Estruturas de repetição com suporte a aninhamento puro (`while` e `for...in`).
    * Definição e chamada de funções (incluindo o suporte correto ao token `print()`).
    * Estruturas de dados complexas (Listas, Tuplas, Sets e Dicionários).

---

## 🛠️ Como Testar

Os ficheiros gramaticais deste repositório estão totalmente calibrados e livres de avisos de ambiguidade (*closures*), prontos para serem validados diretamente no [ANTLR Lab](https://web.antlr.org/):

1. Carregar o conteúdo de `PythonLexer.g4` na aba **Lexer**.
2. Carregar o conteúdo de `PythonParser.g4` na aba **Parser**.
3. Definir a *Start Rule* como `code`.
4. Inserir o script de teste na caixa de **Input**.