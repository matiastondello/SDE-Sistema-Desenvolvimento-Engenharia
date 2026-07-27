# 📊 Avaliação do Gestor - SDE

## Visão Geral

A aba **AVALIAÇÃO GESTOR** permite que o gestor (Matias) **avalie seus colaboradores** em relação às 20 competências.

**Objetivo:** Coletar percepção do gestor como base para comparação com autoavaliação e identificar GAPs.

---

## 📊 Estrutura da Tabela

### **Localização:** Aba "AVALIAÇÃO GESTOR"
**Tipo:** Tabela dinâmica estruturada (similar à Autoavaliação)
**Acesso:** Gestor (edição da equipe), RH/Admin (leitura total)

---

## 🔑 Campos da Tabela

| # | Campo | Tipo | Obrigatório | Descrição | Exemplo | Validação |
|---|-------|------|-------------|-----------|---------|-----------|
| 1 | **Ciclo** | Número | ✅ | Número do ciclo | 1 | 1 ou 2 (semestral) |
| 2 | **Colaborador** | Dropdown | ✅ | Quem está sendo avaliado | Pietro | Ref. CADASTRO.Nome |
| 3 | **ID_Competência** | Texto | ✅ | Competência avaliada | TEC001 | Ref. COMPETÊNCIAS.Código |
| 4 | **Competência** | Texto | ✅ | Nome da competência | Promob | Cópia de COMPETÊNCIAS.Nome |
| 5 | **Nota Gestor** | Inteiro | ✅ | Avaliação do gestor (1-5) | 4 | Dropdown 1-5 com cores |
| 6 | **Evidência** | Texto | ✅ | Justificativa observada | "Vi Pietro realizando..." | Min 30 caracteres |
| 7 | **Comentário Adicional** | Texto | ⚠️ | Observações extras | "Excelente desempenho" | Texto livre |
| 8 | **Data Avaliação** | Data | ✅ | Data da avaliação | 16/07/2026 | Automática (TODAY()) |
| 9 | **Status** | Dropdown | ✅ | Rascunho/Concluído | Concluído | Padrão: Rascunho |
| 10 | **Bloqueado** | Booleano | ✅ | Impede edição pós-conclusão | VERDADEIRO | Automático |

---

## 📐 Layout da Tabela

```
(Estrutura idêntica à AUTOAVALIAÇÃO, mas com Nota Gestor)

┌───────┬─────────┬────────────┬──────────┬──────┬──────────────┬────────────┬──────────┬──────────┐
│ Ciclo │ Colab   │ ID_Compet  │ Competên │ Nota │ Evidência    │ Comentário │ Data     │ Status   │
├───────┼─────────┼────────────┼──────────┼──────┼──────────────┼────────────┼──────────┼──────────┤
│   1   │ Pietro  │ TEC001     │ Promob   │  4   │ Realizou proj│ Excelente  │16/07/26  │Concluído │
│   1   │ Pietro  │ TEC002     │ Ardis    │  2   │ Tem dificuldad│ Precisa    │16/07/26  │Concluído │
│  ...  │ ...     │ ...        │ ...      │ ...  │ ...          │ ...        │ ...      │ ...      │
└───────┴─────────┴────────────┴──────────┴──────┴──────────────┴────────────┴──────────┴──────────┘
```

---

## 🎨 Formatação Visual

### **Nota Gestor (Formatação Condicional)**
```
Nota 1: 🔴 Vermelho (#E74C3C)
Nota 2: 🟠 Laranja (#E67E22)
Nota 3: 🟡 Amarelo (#F1C40F)
Nota 4: 🟢 Verde Claro (#A9DFBF)
Nota 5: 🟢 Verde Escuro (#27AE60)
```

### **Status (Formatação Condicional)**
- Rascunho: 🟡 Amarelo (#F1C40F) - Pode editar
- Concluído: 🟢 Verde (#A9DFBF) - Bloqueado

### **Bloqueado (Ícone)**
```
Se Bloqueado = VERDADEIRO:
  Ícone: 🔒 (cadeado)
  Cor: Cinza (#6C757D)
  Célula: Sombreada
```

---

## 🔄 Fluxo de Preenchimento

### **Passo 1: Seletor de Colaborador**
```
Dropdown no topo: [Selecione o colaborador ▼]
  • Pietro
  • Vinícius
  • Tiago
  • Mateus
  • Lorenzo
```

### **Passo 2: Tabela Autofiltrável**
```
Ao selecionar Pietro, tabela mostra:
  - Todos as 20 competências
  - Notas vazias (prontas para preencher)
  - Evidências vazias
```

### **Passo 3: Preenchimento**
```
Para cada competência:
  1. Selecione Nota Gestor (1-5)
  2. Digite evidência baseada em observação
     (Min 30 caracteres - IMPORTANTE!)
  3. Adicione comentário adicional (opcional)
  4. Data preenchida automaticamente
  5. Status: Rascunho (pode voltar a editar)
  6. Clique "Salvar e Próxima"
```

### **Passo 4: Conclusão**
```
Ao terminar as 20 competências:
  1. Clique botão "CONCLUIR AVALIAÇÃO"
  2. Sistema marca Status = "Concluído"
  3. Sistema marca Bloqueado = VERDADEIRO
  4. Sistema bloqueia edição (cadeado)
  5. Sistema registra no Histórico
  6. Aviso: "Avaliação concluída"
  7. Nota: Apenas RH/Admin pode desbloquear
```

---

## 📋 Validações

### **Nota Gestor**
```
Tipo: Dropdown 1-5
Obrigatório: ✅ Sim
Validação: ENTRE(Valor, 1, 5)
Cores: Conforme escala 1-5
```

### **Evidência**
```
Tipo: Texto
Obrigatório: ✅ Sim (CRÍTICO!)
Validação: LEN(Texto) >= 30
Mensagem: "Evidência deve ter ao menos 30 caracteres"
Máx: 500 caracteres
Propósito: Garantir observações baseadas em fatos
```

### **Comentário Adicional**
```
Tipo: Texto
Obrigatório: ⚠️ Não
Validação: Máx 200 caracteres
Observação pessoal do gestor
```

### **Data Avaliação**
```
Tipo: Data
Obrigatório: ✅ Sim
Validação: Automática (TODAY())
Bloqueado: Usuário não pode editar
Formato: DD/MM/YYYY
```

### **Bloqueado**
```
Tipo: Booleano
Automático: Fica VERDADEIRO após conclusão
Efeito: Bloqueia todas as células da linha
Edição: Apenas RH/Admin pode desbloquear (com senha)
```

---

## 🔐 Controle de Acesso

| Usuário | Pode Ver | Pode Editar | Notas |
|---------|----------|------------|-------|
| Colaborador | ❌ Não | ❌ Não | Não vê sua avaliação até conclusão |
| Gestor | Sua equipe | Até concluir | Após: bloqueado |
| RH/Admin | Todos | ✅ Sim (com senha) | Pode desbloquear se necessário |

---

## 🔗 Relacionamentos

```
AVALIAÇÃO_GESTOR ──→ CADASTRO (Colaborador)
AVALIAÇÃO_GESTOR ──→ COMPETÊNCIAS (ID_Competência)
AVALIAÇÃO_GESTOR ──→ HISTÓRICO (registra novo preenchimento)
AVALIAÇÃO_GESTOR ──→ ANÁLISE GAP (compara com Autoavaliação)
AVALIAÇÃO_GESTOR ──→ DASHBOARD (alimenta gráficos)
```

---

## 📊 Estatísticas Automáticas

### **Cards no Topo (Gestor)**

```
┌──────────────────┬──────────────────┬──────────────────┐
│ MÉDIA DA EQUIPE  │ AVALIAÇÕES       │ CICLO ATUAL      │
│ (por Gestor)     │ COMPLETAS        │                  │
│     3.4          │                  │     1 de 1       │
│   /5.00          │  100% (5/5)      │   (Semestral)    │
│ (68% de 3.5)     │                  │                  │
└──────────────────┴──────────────────┴──────────────────┘

Fórmulas:
Média Equipe = AVERAGE(Nota Gestor)
Avaliações Completas = COUNTIF(Status = "Concluído") / COUNTA(Colaborador)
```

---

## 🔔 Notificações

### **Para Gestor**
```
✅ "Autoavaliação de [Nome] recebida"
  → Pietro completou sua autoavaliação

🔴 "Avaliação de [Nome] atrasada"
  → Mateus ainda não foi avaliado

✅ "Avaliação de [Nome] enviada"
  → Avaliação de Vinícius foi para análise
```

### **Para Colaborador**
```
⏳ "Sua avaliação está em andamento"
  → Gestor está preenchendo

✅ "Sua avaliação foi concluída"
  → Pode visualizar comparação no Dashboard Individual

📊 "GAP Analysis disponível"
  → Compare sua autoavaliação com avaliação gestor
```

---

## 🔄 Fórmulas de Busca Automática

### **Competência (Lookup)**
```excel
=INDEX(COMPETÊNCIAS[Nome], 
       MATCH(ID_Competência, COMPETÊNCIAS[Código], 0))
```

### **Média por Categoria (para Dashboard)**
```excel
=AVERAGE(IF(COMPETÊNCIAS[Categoria]="Técnica", 
            AVALIAÇÃO_GESTOR[Nota], ""))
```

---

## 📤 Ações Disponíveis

### **Botões**
- 📝 Rascunho (Salva sem finalizar)
- ✅ Concluir Avaliação (Bloqueia edição)
- 📄 Imprimir (Versão formatada)
- 📥 Exportar PDF (Relatório avaliação)
- 🔓 Desbloquear (RH/Admin - reposiciona edição)

---

## 🎯 Diferenças vs Autoavaliação

| Aspecto | Autoavaliação | Avaliação Gestor |
|---------|---------------|------------------|
| **Quem Preenche** | Colaborador | Gestor (Matias) |
| **Baseado em** | Percepção própria | Observação real |
| **Evidência Min** | 20 caracteres | 30 caracteres (mais rigoroso) |
| **Bloqueio** | ❌ Não | ✅ Sim (após conclusão) |
| **Comparação** | Usada para GAP | Usada como referência |
| **Propósito** | Auto-reflexão | Feedback externo |

---

## 📋 Checklist de Implementação

- [ ] Criar tabela com 100 linhas (5 colab × 20 competências)
- [ ] Configurar dropdowns (Colaborador, Nota 1-5, Status)
- [ ] Aplicar formatação visual (cores por nota)
- [ ] Aplicar formatação condicional (Status, Bloqueado)
- [ ] Criar validações (Nota, Evidência min 30 chars)
- [ ] Implementar fórmulas de lookup (Competência)
- [ ] Criar botão "Concluir Avaliação"
- [ ] Implementar sistema de bloqueio/desbloqueio
- [ ] Testar seletor de colaborador
- [ ] Testar validação de evidência
- [ ] Validar referência no Histórico
- [ ] Testar com todos os 5 colaboradores
- [ ] Implementar notificações (opcional v1.1)

---

**Avaliação Gestor v1.0**  
*Última atualização: Julho 2026*
