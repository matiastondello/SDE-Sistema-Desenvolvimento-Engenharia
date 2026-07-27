# 📋 Cadastro de Colaboradores - SDE

## Visão Geral

A aba **CADASTRO** é a **base de dados mestre** do sistema. Contém todas as informações sobre os colaboradores e é a fonte de verdade para o restante do sistema.

**Objetivo:** Gerenciar de forma centralizada todos os dados dos colaboradores da Engenharia.

---

## 📊 Estrutura da Tabela

### **Localização:** Aba "CADASTRO"
**Tipo:** Tabela dinâmica estruturada (Excel Table)
**Acesso:** RH/Admin (edição), Gestor (leitura), Colaborador (leitura própria)

---

## 🔑 Campos da Tabela

| # | Campo | Tipo | Obrigatório | Descrição | Exemplo | Validação |
|---|-------|------|-------------|-----------|---------|-----------|
| 1 | **Código** | Inteiro | ✅ | ID único do colaborador | 001 | Autoincremento, Chave Primária |
| 2 | **Nome** | Texto | ✅ | Nome completo | Pietro | Sem números, máx 100 caracteres |
| 3 | **Cargo Atual** | Dropdown | ✅ | Cargo atual | Pleno | Trainee, Pleno, Sênior, Líder |
| 4 | **Próximo Cargo** | Dropdown | ⚠️ | Cargo desejado | Sênior | Trainee, Pleno, Sênior, Líder |
| 5 | **Gestor** | Dropdown | ✅ | Gestor responsável | Matias | Seleção da tabela (CADASTRO.Nome) |
| 6 | **Data Admissão** | Data | ✅ | Data de contratação | 01/01/2022 | Passada, formato DD/MM/YYYY |
| 7 | **Área** | Dropdown | ✅ | Área de atuação | Engenharia | Engenharia (padrão) |
| 8 | **Status** | Dropdown | ✅ | Situação do colaborador | Ativo | Ativo, Inativo, Licença, Desligado |
| 9 | **Data Cadastro** | Data | ✅ | Data de inclusão no sistema | 15/07/2026 | Automática (TODAY()) |
| 10 | **Observações** | Texto | ⚠️ | Notas gerais | Ex: Promovido em 2025 | Texto livre, máx 500 caracteres |

---

## 📐 Layout da Tabela

```
┌─────┬────────┬───────────┬──────────────┬────────┬────────────┬──────┬────────┬──────────────┬─────────────┐
│ Cod │ Nome   │ Cargo Atu │ Próx Cargo   │ Gestor │ Data Admis │ Área │ Status │ Data Cad     │ Observações │
├─────┼────────┼───────────┼──────────────┼────────┼────────────┼──────┼────────┼──────────────┼─────────────┤
│ 001 │ Pietro │ Pleno     │ Sênior       │ Matias │ 01/01/2022 │ Eng  │ Ativo  │ 15/07/2026   │ -           │
│ 002 │ Viníc. │ Trainee   │ Pleno        │ Matias │ 15/03/2023 │ Eng  │ Ativo  │ 15/07/2026   │ -           │
│ 003 │ Tiago  │ Pleno     │ Sênior       │ Matias │ 10/06/2021 │ Eng  │ Ativo  │ 15/07/2026   │ -           │
│ 004 │ Mateus │ Sênior    │ Líder        │ Matias │ 01/02/2020 │ Eng  │ Ativo  │ 15/07/2026   │ -           │
│ 005 │ Lorenz │ Pleno     │ Sênior       │ Matias │ 20/08/2022 │ Eng  │ Ativo  │ 15/07/2026   │ -           │
└─────┴────────┴───────────┴──────────────┴────────┴────────────┴──────┴────────┴──────────────┴─────────────┘
```

---

## 👥 Dados Iniciais - 5 Colaboradores + 1 Coordenador

### **Coordenador (RH/Admin)**
```
Código: 000
Nome: Matias
Cargo: Coordenador
Próximo Cargo: -
Gestor: -
Data Admissão: 01/01/2020
Área: Engenharia
Status: Ativo
Observações: Gestor geral - Acesso RH
```

### **Colaboradores**

**1. Pietro**
```
Código: 001
Nome: Pietro
Cargo: Pleno
Próximo Cargo: Sênior
Gestor: Matias
Data Admissão: 01/01/2022
Área: Engenharia
Status: Ativo
Observações: Especialista em Promob
```

**2. Vinícius**
```
Código: 002
Nome: Vinícius
Cargo: Trainee
Próximo Cargo: Pleno
Gestor: Matias
Data Admissão: 15/03/2023
Área: Engenharia
Status: Ativo
Observações: Iniciante, em desenvolvimento
```

**3. Tiago**
```
Código: 003
Nome: Tiago
Cargo: Pleno
Próximo Cargo: Sênior
Gestor: Matias
Data Admissão: 10/06/2021
Área: Engenharia
Status: Ativo
Observações: Forte em estrutura de produto
```

**4. Mateus**
```
Código: 004
Nome: Mateus
Cargo: Sênior
Próximo Cargo: Líder
Gestor: Matias
Data Admissão: 01/02/2020
Área: Engenharia
Status: Ativo
Observações: Candidato a liderança
```

**5. Lorenzo**
```
Código: 005
Nome: Lorenzo
Cargo: Pleno
Próximo Cargo: Sênior
Gestor: Matias
Data Admissão: 20/08/2022
Área: Engenharia
Status: Ativo
Observações: Desenvolvimento consistente
```

---

## 🎯 Validações de Dados

### **Campo: Código**
```
Tipo: Inteiro
Validação: Autoincremento (001, 002, 003...)
Regra: Não pode repetir
Mensagem: "Código já existe"
```

### **Campo: Nome**
```
Tipo: Texto
Validação: Sem números, sem caracteres especiais
Regra: Min 3 caracteres, máx 100
Mensagem: "Nome deve ter entre 3 e 100 caracteres"
```

### **Campo: Cargo Atual**
```
Tipo: Dropdown (Data Validation)
Opções: Trainee, Pleno, Sênior, Líder
Obrigatório: ✅ Sim
Mensagem: "Selecione um cargo válido"
```

### **Campo: Próximo Cargo**
```
Tipo: Dropdown (Data Validation)
Opções: Trainee, Pleno, Sênior, Líder
Obrigatório: ⚠️ Não
Validação Extra: Próximo Cargo ≠ Cargo Atual
Mensagem: "Próximo cargo deve ser diferente do atual"
```

### **Campo: Gestor**
```
Tipo: Dropdown (Data Validation)
Opções: CADASTRO.Nome (referência dinâmica)
Obrigatório: ✅ Sim
Mensagem: "Selecione um gestor válido"
Fórmula: =CADASTRO[Nome]
```

### **Campo: Data Admissão**
```
Tipo: Data
Validação: Não pode ser futura
Formato: DD/MM/YYYY
Regra: TODAY() ou passada
Mensagem: "Data não pode ser futura"
```

### **Campo: Área**
```
Tipo: Dropdown (Data Validation)
Opções: Engenharia
Obrigatório: ✅ Sim
Nota: Preparado para expansão (outras áreas)
```

### **Campo: Status**
```
Tipo: Dropdown (Data Validation)
Opções: Ativo, Inativo, Licença, Desligado
Obrigatório: ✅ Sim
Padrão: Ativo
Mensagem: "Selecione um status válido"
```

### **Campo: Data Cadastro**
```
Tipo: Data
Validação: Automática (TODAY())
Formato: DD/MM/YYYY
Bloqueado: Usuário não pode editar
Fórmula: =TODAY()
```

### **Campo: Observações**
```
Tipo: Texto
Validação: Máx 500 caracteres
Obrigatório: ⚠️ Não
Permitir quebras de linha: ✅ Sim
```

---

## 🎨 Formatação Visual

### **Headers**
- Cor de fundo: #1F4788 (Azul corporativo)
- Cor de texto: Branco
- Fonte: Arial, 11pt, negrito
- Altura: 25pt

### **Linhas Alternadas**
- Linha par: #F8F9FA (Cinza muito claro)
- Linha ímpar: Branco
- Objetivo: Melhor legibilidade

### **Status (Formatação Condicional)**
- Ativo: 🟢 Verde (#A9DFBF)
- Inativo: 🟡 Amarelo (#F1C40F)
- Licença: 🟠 Laranja (#E67E22)
- Desligado: 🔴 Vermelho (#E74C3C)

### **Largura das Colunas**
```
Código:         10cm
Nome:           15cm
Cargo Atual:    12cm
Próximo Cargo:  12cm
Gestor:         12cm
Data Admissão:  12cm
Área:           10cm
Status:         10cm
Data Cadastro:  12cm
Observações:    20cm
```

---

## 📌 Índices e Relacionamentos

### **Índice Primário**
- Campo: **Código**
- Tipo: Chave Primária Única
- Função: Identificador único do colaborador

### **Índice Secundário**
- Campo: **Nome**
- Tipo: Índice único
- Função: Garantir nomes únicos (evitar duplicatas)

### **Relacionamentos**
```
CADASTRO.Código ───┬─→ AUTOAVALIAÇÃO.ID_Colaborador
                    ├─→ AVALIAÇÃO_GESTOR.ID_Colaborador
                    ├─→ ANÁLISE_GAP.ID_Colaborador
                    ├─→ FEEDFORWARD.ID_Colaborador
                    ├─→ PDI.ID_Colaborador
                    └─→ HISTÓRICO.ID_Colaborador

CADASTRO.Nome ────→ Dropdown em vários campos
                    (Gestor, Responsável PDI, etc)
```

---

## 🔐 Controle de Acesso

| Função | Pode Ver | Pode Criar | Pode Editar | Pode Deletar |
|--------|----------|-----------|-------------|-------------|
| **Colaborador** | Dados próprios | ❌ Não | ❌ Não | ❌ Não |
| **Gestor** | Sua equipe | ❌ Não | ❌ Não | ❌ Não |
| **RH/Admin** | Todos | ✅ Sim | ✅ Sim | ✅ Sim (com cuidado) |

---

## 🔧 Operações Permitidas

### **RH/Admin pode:**
1. ✅ Adicionar novo colaborador
2. ✅ Editar dados existentes
3. ✅ Marcar como Inativo/Desligado
4. ✅ Atualizar status
5. ✅ Adicionar observações
6. ❌ Deletar (manter histórico)

### **Ao Adicionar Colaborador:**
1. ✅ Sistema gera Código automaticamente
2. ✅ Sistema registra Data Cadastro
3. ✅ Sistema cria entradas em Histórico
4. ✅ Sistema gera notificação

### **Ao Editar Colaborador:**
1. ✅ Sistema registra mudança no Histórico
2. ✅ Sistema identifica quem editou
3. ✅ Sistema marca data/hora
4. ✅ Nenhum dado é perdido

---

## 📊 Estatísticas Automáticas

### **Cards no Topo da Aba**

```
┌──────────────────┬──────────────────┬──────────────────┐
│ TOTAL ATIVO      │ TOTAL INATIVO    │ ROTATIVIDADE     │
│                  │                  │                  │
│     5             │     0             │     0%           │
│ 100%             │ 0%               │ (últimos 12m)    │
└──────────────────┴──────────────────┴──────────────────┘

Fórmulas:
Total Ativo: =COUNTIF(CADASTRO[Status], "Ativo")
Total Inativo: =COUNTIF(CADASTRO[Status], "Inativo")
Rotatividade: =COUNTIF(CADASTRO[Status], "Desligado") / COUNTA(CADASTRO[Status])

┌──────────────────┬──────────────────┬──────────────────┐
│ POR CARGO        │ POR GESTOR       │ TEMPO MÉDIO      │
│                  │                  │                  │
│ Trainee: 1 (20%) │ Matias: 5 (100%) │ 2a 10m           │
│ Pleno: 3 (60%)   │                  │                  │
│ Sênior: 1 (20%)  │                  │                  │
│ Líder: 0 (0%)    │                  │                  │
└──────────────────┴──────────────────┴──────────────────┘

Fórmulas:
Trainee: =COUNTIF(CADASTRO[Cargo Atual], "Trainee")
Tempo Médio: =AVERAGE(TODAY() - CADASTRO[Data Admissão]) / 365.25 & " anos"
```

---

## 🔄 Fluxo de Dados

```
Ao Abrir CADASTRO:
  1. Valida integridade de dados
  2. Atualiza estatísticas
  3. Sincroniza com dropdowns em outras abas
  4. Exibe aviso se houver erros de validação

Ao Adicionar Colaborador:
  1. Gera novo Código (autoincremento)
  2. Registra Data Cadastro (TODAY())
  3. Registra no Histórico (tipo: "Novo Colaborador")
  4. Atualiza dropdown em todas as abas

Ao Editar Colaborador:
  1. Registra mudança no Histórico
  2. Identifica qual campo mudou
  3. Registra valor anterior e novo
  4. Registra quem editou e quando

Ao Marcar Inativo/Desligado:
  1. Mantém dados intactos
  2. Filtra de formulários de avaliação
  3. Mantém no histórico
  4. Gera relatório de desligamento
```

---

## 📋 Checklist de Implementação

- [ ] Criar tabela CADASTRO com 10 colunas
- [ ] Inserir 5 colaboradores + Matias
- [ ] Configurar data validation para dropdowns
- [ ] Aplicar formatação visual (cores, largura)
- [ ] Criar formatação condicional (Status)
- [ ] Implementar validações de dados
- [ ] Criar estatísticas automáticas
- [ ] Proteger estrutura (apenas dados editáveis)
- [ ] Criar macro de sincronização
- [ ] Testar integridade de referências
- [ ] Documentar como adicionar novo colaborador
- [ ] Treinar RH/Admin

---

## 📤 Saídas Esperadas

### **Ao Clicar no Botão "Adicionar Colaborador"**
```
Abre formulário:
  - Campo Código (automático)
  - Campo Nome (obrigatório)
  - Dropdown Cargo Atual
  - Dropdown Próximo Cargo
  - Dropdown Gestor
  - Campo Data Admissão
  - Dropdown Área
  - Dropdown Status
  - Campo Observações
  
  Botões: [Salvar] [Cancelar]
```

### **Ao Clicar em "Relatório de Colaboradores"**
```
PDF com:
  - Tabela completa
  - Estatísticas
  - Gráficos por cargo
  - Gráficos por status
  - Data geração
```

---

## 🎓 Instrução de Uso

### **Para RH/Admin - Adicionar Novo Colaborador:**

1. Clique em "Aba CADASTRO"
2. Vá para linha em branco abaixo da última entrada
3. Código será preenchido automaticamente
4. Preencha Nome (ex: João)
5. Selecione Cargo Atual no dropdown
6. Selecione Próximo Cargo (opcional)
7. Selecione Gestor (ex: Matias)
8. Digite Data Admissão (ex: 15/07/2026)
9. Confirme Área (padrão: Engenharia)
10. Selecione Status (padrão: Ativo)
11. Pressione ENTER ou clique Salvar
12. Sistema registra automáticamente no Histórico

---

## 🚨 Validações de Erro

```
Se Código duplicado:
  ❌ "Erro: Código já existe no sistema"
  → Sistema não permite salvar

Se Nome vazio:
  ❌ "Erro: Nome é obrigatório"
  → Campo fica destacado em vermelho

Se Cargo vazio:
  ❌ "Erro: Cargo é obrigatório"
  → Campo fica destacado em vermelho

Se Data Admissão futura:
  ❌ "Erro: Data não pode ser futura"
  → Campo fica destacado em vermelho

Se Próximo Cargo = Cargo Atual:
  ⚠️ "Aviso: Próximo cargo igual ao atual"
  → Permite continuar (aviso apenas)

Se Gestor não existe:
  ❌ "Erro: Gestor deve existir no cadastro"
  → Dropdown força seleção válida
```

---

**Cadastro de Colaboradores v1.0**  
*Última atualização: Julho 2026*
