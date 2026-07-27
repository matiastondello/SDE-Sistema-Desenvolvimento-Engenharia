# 🧠 Competências - SDE

## Visão Geral

A aba **COMPETÊNCIAS** é a **tabela mestre** do sistema. Define todas as 20 competências avaliadas, suas categorias, descrições e como elas variam por cargo.

**Esta aba é PROTEGIDA - apenas RH/Admin pode editar.**

---

## 📊 Estrutura da Tabela

### **Localização:** Aba "COMPETÊNCIAS"
**Tipo:** Tabela dinâmica estruturada (protegida)
**Acesso:** RH/Admin (edição), Todos (leitura)

---

## 🔑 Campos da Tabela

| # | Campo | Tipo | Obrigatório | Descrição | Exemplo | Validação |
|---|-------|------|-------------|-----------|---------|-----------|
| 1 | **Código** | Texto | ✅ | ID único (AAA### format) | TEC001 | Padrão: TEC, EXE, COM, LID |
| 2 | **Nome** | Texto | ✅ | Nome da competência | Promob | Único, sem duplicatas |
| 3 | **Categoria** | Dropdown | ✅ | Técnica, Execução, Comportamental, Liderança | Técnica | 4 categorias |
| 4 | **Objetivo** | Texto | ✅ | Objetivo da competência | Dominar software de modelagem | Min 20 caracteres |
| 5 | **Peso** | Número | ⚠️ | Peso relativo (1-10) | 1.0 | Padrão: 1.0 (igual) |
| 6 | **Descrição** | Texto | ✅ | Descrição detalhada | Software usado na Florense... | Min 30 caracteres |
| 7 | **Nível Trainee** | Número | ✅ | Expectativa para Trainee | 2.0 | 1-5, decimal |
| 8 | **Nível Pleno** | Número | ✅ | Expectativa para Pleno | 3.5 | 1-5, decimal |
| 9 | **Nível Sênior** | Número | ✅ | Expectativa para Sênior | 4.5 | 1-5, decimal |
| 10 | **Nível Líder** | Número | ✅ | Expectativa para Líder | 5.0 | 1-5, decimal |
| 11 | **Status** | Dropdown | ✅ | Ativo, Inativo | Ativo | Padrão: Ativo |

---

## 📋 As 20 Competências

### **TÉCNICAS (5)**

```
┌─────────┬─────────┬──────────────────┬────────────┬────────────┬────────────┬─────────┐
│ Código  │ Nome    │ Objetivo         │ Trainee    │ Pleno      │ Sênior     │ Líder   │
├─────────┼─────────┼──────────────────┼────────────┼────────────┼────────────┼─────────┤
│ TEC001  │ Promob  │ Dominar software │ 2.0        │ 3.5        │ 4.5        │ 5.0     │
│ TEC002  │ Ardis   │ Sistema de design│ 2.0        │ 3.5        │ 4.5        │ 5.0     │
│ TEC003  │ Estru.  │ Estrutura prod.  │ 2.0        │ 3.5        │ 4.5        │ 5.0     │
│ TEC004  │ CAD/CAM │ Desenho técnico  │ 2.0        │ 3.5        │ 4.5        │ 5.0     │
│ TEC005  │ Qualid. │ Controle qualid. │ 2.5        │ 3.5        │ 4.0        │ 4.5     │
└─────────┴─────────┴──────────────────┴────────────┴────────────┴────────────┴─────────┘
```

### **EXECUÇÃO (5)**

```
┌─────────┬──────────┬──────────────────┬────────────┬────────────┬────────────┬─────────┐
│ Código  │ Nome     │ Objetivo         │ Trainee    │ Pleno      │ Sênior     │ Líder   │
├─────────┼──────────┼──────────────────┼────────────┼────────────┼────────────┼─────────┤
│ EXE001  │ Planej.  │ Planejar ativid. │ 2.5        │ 3.5        │ 4.0        │ 4.5     │
│ EXE002  │ Organiz. │ Organizar trab.  │ 2.5        │ 3.5        │ 4.0        │ 4.5     │
│ EXE003  │ Prioriz. │ Priorizar tarefas│ 2.5        │ 3.5        │ 4.0        │ 4.5     │
│ EXE004  │ Prazos   │ Cumprir prazos   │ 2.5        │ 3.5        │ 4.0        │ 4.5     │
│ EXE005  │ Problem. │ Resolver problem.│ 2.5        │ 3.5        │ 4.5        │ 5.0     │
└─────────┴──────────┴──────────────────┴────────────┴────────────┴────────────┴─────────┘
```

### **COMPORTAMENTAL (5)**

```
┌─────────┬──────────┬──────────────────┬────────────┬────────────┬────────────┬─���───────┐
│ Código  │ Nome     │ Objetivo         │ Trainee    │ Pleno      │ Sênior     │ Líder   │
├─────────┼──────────┼──────────────────┼────────────┼────────────┼────────────┼─────────┤
│ COM001  │ Comunic. │ Comunicar ideias │ 2.5        │ 3.0        │ 3.5        │ 4.0     │
│ COM002  │ Colabor. │ Colaborar equipe │ 2.5        │ 3.0        │ 3.5        │ 4.0     │
│ COM003  │ Comprom. │ Comprometimento  │ 2.5        │ 3.0        │ 3.5        │ 4.0     │
│ COM004  │ Proacti. │ Proatividade     │ 2.5        │ 3.0        │ 3.5        │ 4.0     │
│ COM005  │ Aprend.  │ Aprendizado cont.│ 2.5        │ 3.0        │ 3.5        │ 4.0     │
└─────────┴──────────┴──────────────────┴────────────┴────────────┴────────────┴─────────┘
```

### **LIDERANÇA (5)**

```
┌─────────┬──────────┬──────────────────┬────────────┬────────────┬────────────┬─────────┐
│ Código  │ Nome     │ Objetivo         │ Trainee    │ Pleno      │ Sênior     │ Líder   │
├─────────┼──────────┼──────────────────┼────────────┼────────────┼────────────┼─────────┤
│ LID001  │ Desenv.  │ Desenvolver pes. │ 1.0        │ 2.0        │ 3.5        │ 4.5     │
│ LID002  │ Feedfw.  │ Dar feedforward  │ 1.0        │ 2.0        │ 3.5        │ 4.5     │
│ LID003  │ Delegaç. │ Delegar tarefas  │ 1.0        │ 2.0        │ 3.5        │ 4.5     │
│ LID004  │ Indicad. │ Gestão indicador │ 1.0        │ 2.0        │ 3.5        │ 4.5     │
│ LID005  │ Decisão  │ Tomar decisão    │ 1.0        │ 2.0        │ 3.5        │ 4.5     │
└─────────┴──────────┴──────────────────┴────────────┴────────────┴────────────┴─────────┘
```

---

## 📐 Layout Completo

```
┌──────────┬────────────┬───────────┬──────────────┬────┬────────────┬────────┬────────┬────────┬────────┬────────┐
│ Código   │ Nome       │ Categoria │ Objetivo     │Peso│ Descrição  │Trainee │ Pleno  │ Senior │ Líder  │ Status │
├──────────┼────────────┼───────────┼──────────────┼────┼────────────┼────────┼────────┼────────┼────────┼────────┤
│ TEC001   │ Promob     │ Técnica   │ Dominar ...  │1.0 │ Software...│ 2.0    │ 3.5    │ 4.5    │ 5.0    │ Ativo  │
│ TEC002   │ Ardis      │ Técnica   │ Sistema ...  │1.0 │ Ferramenta │ 2.0    │ 3.5    │ 4.5    │ 5.0    │ Ativo  │
│ ...      │ ...        │ ...       │ ...          │... │ ...        │ ...    │ ...    │ ...    │ ...    │ ...    │
└──────────┴────────────┴───────────┴──────────────┴────┴────────────┴────────┴────────┴────────┴────────┴────────┘
```

---

## 🎨 Formatação Visual

### **Headers**
- Cor de fundo: #1F4788 (Azul corporativo)
- Cor de texto: Branco
- Fonte: Arial, 11pt, negrito
- Altura: 25pt

### **Categoria (Formatação Condicional)**
- Técnica: #3498DB (Azul)
- Execução: #2ECC71 (Verde)
- Comportamental: #E74C3C (Vermelho)
- Liderança: #F39C12 (Laranja)

### **Nível Expectativa (Formatação Numérica)**
```
1.0 = 🔴 Vermelho
2.0 = 🟠 Laranja
2.5 = 🟡 Amarelo
3.0 = 🟡 Amarelo
3.5 = 🟡 Amarelo
4.0 = 🟢 Verde Claro
4.5 = 🟢 Verde Claro
5.0 = 🟢 Verde Escuro
```

### **Status (Formatação Condicional)**
- Ativo: 🟢 Verde (#A9DFBF)
- Inativo: 🔴 Vermelho (#E74C3C)

---

## 🔐 Proteção de Estrutura

**Esta aba é PROTEGIDA com senha (RH/Admin só):**

✅ Permitido:
- Leitura de dados
- Cópia de células
- Visualização de fórmulas (não pode editar)

❌ Bloqueado:
- Adicionar/remover linhas
- Adicionar/remover colunas
- Editar células (sem senha)
- Mover/deletar dados
- Alterar formatação

**Senha:** [Será definida no arquivo Excel]

---

## 📊 Tabela de Pesos (Futuro)

**Preparação para v1.1:**

```
Peso pode ser ajustado para dar importância diferente:

Exemplo - Cargo Sênior:
  - Técnica: peso 1.5 (mais importante)
  - Execução: peso 1.0 (neutro)
  - Comportamental: peso 1.0 (neutro)
  - Liderança: peso 1.2 (importante)

Fórmula de Média Ponderada:
  Média = SUM(Nota * Peso) / SUM(Peso)
```

---

## 🔗 Relacionamentos

```
COMPETÊNCIAS.Código ──┬─→ AUTOAVALIAÇÃO.ID_Competência
                       ├─→ AVALIAÇÃO_GESTOR.ID_Competência
                       ├─→ ANÁLISE_GAP.ID_Competência
                       ├─→ FEEDFORWARD.ID_Competência
                       ├─→ PDI.ID_Competência
                       └─→ HISTÓRICO.ID_Competência

COMPETÊNCIAS.Código ──→ Radar charts (Dashboard)
COMPETÊNCIAS.Código ──→ Dropdown em formulários
```

---

## 📌 Validações

### **Código**
```
Formato: AAA### (3 letras + 3 números)
Exemplo: TEC001, EXE002, COM001, LID005
Regra: Único, não repetido
Padrão: TEC, EXE, COM, LID
```

### **Nome**
```
Máx 20 caracteres
Sem números
Sem caracteres especiais
Exemplo: Promob, Planejamento
```

### **Categoria**
```
Dropdown: Técnica, Execução, Comportamental, Liderança
Obrigatório
```

### **Expectativas (Trainee, Pleno, Sênior, Líder)**
```
Tipo: Número decimal (1 casa)
Valor: 1.0 até 5.0
Padrão: Progressivo (Trainee < Pleno < Sênior < Líder)
Validação: Valor ≤ anterior a Líder = 5.0
```

---

## 📋 Checklist de Implementação

- [ ] Criar tabela com 20 competências
- [ ] Inserir todas as descrições
- [ ] Configurar expectativas por cargo
- [ ] Aplicar formatação visual
- [ ] Aplicar formatação condicional
- [ ] Proteger estrutura com senha
- [ ] Testar relacionamentos
- [ ] Validar dropdowns em outras abas
- [ ] Documentar lista de competências
- [ ] Criar versão impressível

---

**Competências v1.0**  
*Última atualização: Julho 2026*
