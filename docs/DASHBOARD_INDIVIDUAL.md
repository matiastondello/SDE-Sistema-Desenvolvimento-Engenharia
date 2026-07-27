# 👤 Dashboard Individual - SDE

## Visão Geral

O **Dashboard Individual** é a tela de **desenvolvimento personalizado** de cada colaborador. Permite visualizar em detalhes:

- Autoavaliação vs Avaliação do Gestor
- Análise de GAP
- Histórico de evolução
- PDI (Plano de Desenvolvimento Individual)
- Feedforward (Próximos passos)
- Competências prioritárias para desenvolvimento

**Objetivo:** Dar ao colaborador e gestor uma visão completa e clara do seu desenvolvimento.

---

## 🎯 Componentes do Dashboard Individual

### **1. SELETOR DE COLABORADOR** (Topo)
**Localização:** Topo esquerdo  
**Tipo:** Dropdown lista suspensa

```
Selecione um Colaborador: ▼ [Pietro        ]
                            • Pietro
                            • Vinícius
                            • Tiago
                            • Mateus
                            • Lorenzo
```

**Fórmula:**
```excel
Data Validation:
  Type: List
  Source: =Cadastro!B:B (excluindo header)
  Error Alert: "Selecione um colaborador válido"
```

**Célula de Referência:** Dashboard_Individual!B2

Quando muda → Todos os gráficos se atualizam automaticamente

---

### **2. CARDS INFORMATIVOS** (Abaixo do seletor)
**Localização:** Segunda linha  
**Tipo:** Boxes informativos

```
┌─────────────────┬─────────────────┬──────────────────┐
│ CARGO ATUAL     │ PRÓXIMO CARGO   │ MÉDIA GERAL      │
│                 │                 │                  │
│ Pleno           │ Sênior          │ 3.8 / 5.0        │
│                 │                 │ (76% de 5.0)     │
└─────────────────┴─────────────────┴──────────────────┘

Fórmulas (VLOOKUP):
Cargo_Atual: =VLOOKUP(B2, Cadastro!B:C, 2, FALSE)
Proximo_Cargo: =VLOOKUP(B2, Cadastro!B:E, 4, FALSE)
Media_Geral: =AVERAGE(IF(Avaliação_Gestor!$B$:$B$=B2, Avaliação_Gestor!E:E))
```

---

### **3. RADAR DE COMPETÊNCIAS** (Gráfico Principal - Centro)
**Localização:** Centro-esquerda, ocupa 40% da largura  
**Tipo:** Radar Chart (Spider Chart)

```
                  Promob
                    ↑
             5 ╱─────────╲
               │         │
            4  │  ╱───╲  │
               │ │ ╱─╲ │ │
            3  │ ││   │ │ │  Legenda:
               │ ││   ││ │    ── Expectativa
            2  │ ││ X ││ │    ── Auto
               │  │   │  │    ── Gestor
            1  │  └───┘  │
               └─────────┘
            
    Eixos: 5 Competências por categoria
    Série 1 (linha sólida): Expectativa por cargo
    Série 2 (linha tracejada): Autoavaliação
    Série 3 (linha pontilhada): Avaliação Gestor
```

**Dados do Radar:**
```
Competência | Expectativa | Auto | Gestor
TEC001      | 3.5         | 3    | 4
TEC002      | 3.5         | 2    | 2
TEC003      | 3.5         | 3    | 3
TEC004      | 3.5         | 2    | 3
TEC005      | 3.5         | 3    | 3
EXE001      | 3.5         | 3    | 4
... (total 20)
```

**Fórmulas:**
```excel
Expectativa: =INDEX(Competências!F:F, MATCH(Competências!A:A, Competências!A:A, 0))
           (Seleciona expectativa conforme cargo do colaborador)

Auto: =IFERROR(
    INDEX(Autoavaliação!E:E, 
      MATCH(1, (Autoavaliação!$B$:$B$=$B$2)*(Autoavaliação!$D$:$D$=A:A), 0)), "-")
      
Gestor: =IFERROR(
    INDEX(Avaliação_Gestor!C:C, 
      MATCH(1, (Avaliação_Gestor!$B$:$B$=$B$2)*(Avaliação_Gestor!$D$:$D$=A:A), 0)), "-")
```

---

### **4. COMPARAÇÃO AUTO vs GESTOR** (Gráfico de Barras)
**Localização:** Centro-direita, ocupa 30% da largura  
**Tipo:** Clustered Column Chart

```
5.0 │
4.5 │    ██
4.0 │ ██ ██ ██ ██ ██
3.5 │ ██ ██ ██ ██ ██
3.0 │ ██ ██ ██ ██ ██
    └──────────────────────
      TEC EXE COM LID Avg
      
Legenda:
  ■ = Autoavaliação
  ■ = Avaliação Gestor
  
Linha horizontal: Expectativa por cargo
```

**Dados:**
```
Categoria    | Auto | Gestor | GAP | Status
Técnica      | 2.8  | 3.2    | +0.4 | ✅
Execução     | 3.2  | 3.6    | +0.4 | ✅
Comportamento| 3.0  | 3.0    | 0.0  | ✅
Liderança    | 2.2  | 2.8    | +0.6 | ⚠️
```

---

### **5. TABELA GAP DETALHADA** (Tabela com Formatação)
**Localização:** Direita (coluna lateral)  
**Tipo:** Formatted Table

```
ANÁLISE GAP

Competência    Auto  Gest  GAP  Status
───────────────────────────────────────
Promob         3     4     +1   ⚠️ Atenção
Ardis          2     2     0    ✅ Alinhado
Estrutura      3     3     0    ✅ Alinhado
CAD/CAM        2     3     +1   ⚠️ Atenção
Qualidade      3     3     0    ✅ Alinhado
Planejamento   3     4     +1   ⚠️ Atenção
Organização    3     4     +1   ⚠️ Atenção
Priorização    3     3     0    ✅ Alinhado
Prazos         4     4     0    ✅ Alinhado
Problemas      3     3     0    ✅ Alinhado
...

Resumo GAP:
  ✅ Alinhados: 12 (60%)
  ⚠️ Atenção: 6 (30%)
  🔴 Divergência: 2 (10%)
```

**Formatação Condicional:**
```
Se GAP = 0    → Verde (#A9DFBF) - Alinhado
Se GAP = ±1   → Amarelo (#F1C40F) - Atenção
Se GAP ≥ ±2   → Vermelho (#E74C3C) - Divergência
```

---

### **6. HISTÓRICO DE EVOLUÇÃO** (Gráfico de Linhas)
**Localização:** Inferior esquerda, ocupa 50%  
**Tipo:** Line Chart

```
5.0 │
4.5 │         ╱╲
4.0 │    ╱╲  ╱  ╲
3.5 │   ╱  ╲╱    ╲
3.0 │  ╱          ╲╱─
2.5 │╱
    └─────────────────────────
      Ciclo 1  Ciclo 2  Ciclo 3
      
Legenda:
  ── Autoavaliação
  ── Avaliação Gestor
  ── Expectativa
```

**Dados:**
```
Ciclo | Auto | Gestor | Expectativa
  1   | 3.0  | 3.2    | 3.5
  2   | 3.2  | 3.6    | 3.5
  3   | 3.4  | 3.8    | 3.5
```

---

### **7. TABELA PDI** (Plano de Desenvolvimento)
**Localização:** Inferior direita, ocupa 50%  
**Tipo:** Table com barras de progresso

```
PDI - PLANO DE DESENVOLVIMENTO INDIVIDUAL

Objetivo              Status      Prazo      Progresso
─────────────────────────────────────────────────────────
Dominar Promob        Em Andamento 30/09     ████░░░░░░ 50%
  Ação: Treinamento avançado
  Responsável: Matias

Estrutura de Produto  Não Iniciado 31/12    ░░░░░░░░░░ 0%
  Ação: Estudar processos
  Responsável: Pietro

CAD/CAM Avançado      Em Andamento 31/10     ██████░░░░ 65%
  Ação: Certificação CAD
  Responsável: Tiago

Resumo PDI:
  ✅ Concluídos: 1 (25%)
  ⏳ Em Andamento: 2 (50%)
  ⬜ Não Iniciados: 1 (25%)
```

**Barra de Progresso (Fórmula):**
```excel
Progresso = (TODAY() - Data_Início) / (Data_Fim - Data_Início) * 100

IF(Data_Fim < TODAY(), 100,
   IF(Data_Início > TODAY(), 0,
      (TODAY() - Data_Início) / (Data_Fim - Data_Início) * 100))
```

---

### **8. FEEDFORWARD** (Recomendações Futuras)
**Localização:** Abaixo da tabela PDI  
**Tipo:** Texto formatado com cards

```
🎯 FEEDFORWARD - PRÓXIMOS PASSOS

Competência: Promob
├─ Situação Atual: "Executa projetos com segurança"
├─ Próximo Passo: "Mentorar colegas iniciantes"
├─ Ação Recomendada: "Preparar workshop interno"
└─ Prazo: 31/10/2026

Competência: Planejamento
├─ Situação Atual: "Planeja atividades rotineiras"
├─ Próximo Passo: "Liderar planejamento estratégico"
├─ Ação Recomendada: "Participar de reuniões de planejamento"
└─ Prazo: 30/11/2026

Competência: Delegação
├─ Situação Atual: "Não há avaliação"
├─ Próximo Passo: "Desenvolver essa competência"
├─ Ação Recomendada: "Treinamento em liderança"
└─ Prazo: 31/12/2026
```

---

### **9. COMPETÊNCIAS PRIORITÁRIAS** (Badge de Ação)
**Localização:** Topo direita  
**Tipo:** Priority List com cores

```
🔴 CRÍTICAS (Nota < 2.5):
  • CAD/CAM → URGENTE
  
🟠 ALERTA (Nota 2.5-3.0):
  • Ardis
  • Aprendizado Contínuo
  
🟡 ATENÇÃO (Nota 3.0-3.5):
  • Qualidade Técnica
  • Organização
  
🟢 FORTE (Nota ≥ 4.0):
  ✓ Promob
  ✓ Planejamento
  ✓ Prazos

Recomendação:
  → Foco em CAD/CAM
  → Manutenção de força em Promob
```

---

### **10. DADOS PESSOAIS** (Card Lateral)
**Localização:** Topo esquerdo (abaixo do seletor)  
**Tipo:** Information Box

```
┌──────────────────────────┐
│  INFORMAÇÕES PESSOAIS    │
├──────────────────────────┤
│ Nome: Pietro             │
│ Cargo: Pleno             │
│ Área: Engenharia         │
│ Gestor: Matias           │
│ Data Admissão: 01/01/22  │
│ Status: Ativo            │
│ Tempo na Empresa: 4a 6m  │
└──────────────────────────┘
```

---

## 🔄 Atualização Dinâmica

**Quando o usuário muda a seleção no dropdown:**

1. ✅ Todos os gráficos se atualizam (Radar, Barras, Linhas)
2. ✅ Tabelas se reordenam (GAP, PDI, Feedforward)
3. ✅ Cards informativos se atualizam
4. ✅ Dados pessoais mudam
5. ✅ Competências prioritárias se recalculam
6. ✅ Histórico filtra por colaborador

**Tempo de atualização:** < 1 segundo (sem necessidade de macro)

---

## 📊 Fórmulas Principais

### **Referência ao Colaborador Selecionado**
```excel
Célula: B2
Valor: Pietro (selecionado no dropdown)
Referência: $B$2
```

### **Autoavaliação do Colaborador**
```excel
=IFERROR(
    INDEX(Autoavaliação!E:E, 
      MATCH(1, (Autoavaliação!$B$:$B$=$B$2) * (Autoavaliação!$D$:$D$=A5), 0)), 
    "-")
```

### **Avaliação do Gestor**
```excel
=IFERROR(
    INDEX(Avaliação_Gestor!C:C, 
      MATCH(1, (Avaliação_Gestor!$B$:$B$=$B$2) * (Avaliação_Gestor!$D$:$D$=A5), 0)), 
    "-")
```

### **Cálculo do GAP**
```excel
=IF(OR(E5="-", F5="-"), "-", F5 - E5)
```

### **Classificação do GAP**
```excel
=IF(OR(G5="-"), "-",
    IF(ABS(G5)=0, "✅ Alinhado",
       IF(ABS(G5)=1, "⚠️ Atenção",
          IF(ABS(G5)>=2, "🔴 Divergência", ""))))
```

### **Média por Colaborador**
```excel
=AVERAGE(IF(Avaliação_Gestor!$B$:$B$=$B$2, Avaliação_Gestor!E:E))
(Fórmula de array: Ctrl+Shift+Enter)
```

### **Nível Esperado (conforme cargo)**
```excel
=INDEX(Competências!$F:$F, 
    MATCH(Cargo_Atual, Competências!$B:$B, 0),
    MATCH(ID_Competência, Competências!$A:$A, 0))
```

---

## 🎨 Formatação Visual

### **Cores por Nota**
```
Nota 1: Vermelho (#E74C3C)
Nota 2: Laranja (#E67E22)
Nota 3: Amarelo (#F1C40F)
Nota 4: Verde Claro (#A9DFBF)
Nota 5: Verde Escuro (#27AE60)
```

### **Cores por GAP**
```
GAP = 0    : Verde (#A9DFBF) - Alinhado
GAP = ±1   : Amarelo (#F1C40F) - Atenção
GAP ≥ ±2   : Vermelho (#E74C3C) - Divergência
```

### **Ícones (Emojis)**
```
✅ = Concluído / Alinhado
⚠️ = Atenção / Alerta
🔴 = Crítico / Urgente
🟠 = Alto / Alerta
🟡 = Médio / Atenção
🟢 = Bom / OK
📈 = Crescimento
📉 = Queda
```

---

## 📋 Layout Responsivo

```
┌─────────────────────────────────────────────────────────┐
│ DASHBOARD INDIVIDUAL - COLABORADOR                      │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  Selecione: [Pietro ▼]  │  CARGO ATUAL: Pleno         │
│                         │  PRÓXIMO: Sênior             │
│  ┌────────────────────┐ │  MÉDIA: 3.8/5.0              │
│  │  DADOS PESSOAIS    │ │                              │
│  │  Nome: Pietro      │ │  COMPETÊNCIAS PRIORITÁRIAS   │
│  │  Cargo: Pleno      │ │  🔴 CAD/CAM (2.0)            │
│  │  Gestor: Matias    │ │  🟠 Ardis (2.5)              │
│  │  Admissão: 01/22   │ │  🟢 Promob (4.5)             │
│  └────────────────────┘ │                              │
│                         │                              │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────────────┐  ┌──────────────────────────┐ │
│  │  RADAR DE COMPETÊNCIAS │  │ AUTO vs GESTOR (Barras) │ │
│  │  (Spider Chart)        │  │                        │ │
│  │                        │  │                        │ │
│  │  (Gráfico)             │  │  (Gráfico)             │ │
│  └──────────────────────┘  └──────────────────────────┘ │
│                                                          │
│  ┌──────────────────────────────────────────────────┐   │
│  │  ANÁLISE GAP                                      │   │
│  │  Competência    Auto  Gest  GAP  Status          │   │
│  │  ──────────────────────────────────────────      │   │
│  │  Promob         3     4     +1   ⚠️ Atenção      │   │
│  │  Ardis          2     2     0    ✅ Alinhado     │   │
│  │  Estrutura      3     3     0    ✅ Alinhado     │   │
│  │  CAD/CAM        2     3     +1   ⚠️ Atenção      │   │
│  │  Qualidade      3     3     0    ✅ Alinhado     │   │
│  └──────────────────────────────────────────────────┘   │
│                                                          │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────────────────┐  ┌────────────────────┐   │
│  │ HISTÓRICO DE EVOLUÇÃO    │  │ PDI - DESENVOLVIMENTO│   │
│  │ (Gráfico de Linhas)      │  │                     │   │
│  │                          │  │ • Dominar Promob    │   │
│  │ (Gráfico)                │  │   ████░░░░░░ 50%    │   │
│  │                          │  │                     │   │
│  │                          │  │ • CAD/CAM Avanç.    │   │
│  │                          │  │   ██████░░░░ 65%    │   │
│  │                          │  │                     │   │
│  │                          │  │ Resumo:             │   │
│  │                          │  │  ✅ Concluído: 1    │   │
│  │                          │  │  ⏳ Em Progr.: 2    │   │
│  │                          │  │  ⬜ Não Inic.: 1    │   │
│  └──────────────────────────┘  └────────────────────┘   │
│                                                          │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  🎯 FEEDFORWARD - PRÓXIMOS PASSOS                       │
│                                                          │
│  Promob: Mentorar colegas iniciantes → 31/10/26        │
│  Planejamento: Liderar planejamento estratégico → 11/26 │
│  Delegação: Treinamento em liderança → 12/26           │
│                                                          │
├─────────────────────────────────────────────────────────┤
│ Botões: [Voltar] [Imprimir] [Exportar PDF] [Editar PDI] │
└─────────────────────────────────────────────────────────┘
```

---

## 🔐 Controle de Acesso

| Usuário | Pode Ver | Pode Editar | Notas |
|---------|----------|------------|-------|
| Colaborador | Seus dados | PDI próprio | Não vê dados de outros |
| Gestor | Sua equipe | PDI e Feedforward | Pode ver todos de sua área |
| RH/Admin | Todos | Todos os dados | Acesso total |

---

## 📤 Ações Disponíveis

### **Botões**
- 🔙 Voltar (para Dashboard Geral)
- 📄 Imprimir (versão otimizada)
- 📥 Exportar PDF (relatório completo do colaborador)
- ✏️ Editar PDI (abre janela de edição)
- 💬 Adicionar Feedforward (abre formulário)
- 📊 Ver Histórico Completo (abre tabela de histórico)

---

## ✅ Checklist de Implementação

- [ ] Criar dropdown de colaboradores
- [ ] Criar cards informativos
- [ ] Criar Radar Chart
- [ ] Criar gráfico Auto vs Gestor
- [ ] Criar tabela GAP com formatação
- [ ] Criar gráfico histórico
- [ ] Criar tabela PDI com progresso
- [ ] Criar seção Feedforward
- [ ] Criar badge competências prioritárias
- [ ] Testar seleção dinâmica
- [ ] Validar atualização automática
- [ ] Implementar botões de ação
- [ ] Criar versão impressível
- [ ] Testar com todos os 5 colaboradores
- [ ] Documentar instruções de uso

---

**Dashboard Individual v1.0**  
*Última atualização: Julho 2026*
