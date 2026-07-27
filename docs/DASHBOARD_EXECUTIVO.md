# 📊 Dashboard Executivo - SDE

## Visão Geral

O Dashboard Executivo é a **tela de comando** do SDE. Ele consolida **todos os indicadores críticos** em gráficos automáticos que se atualizam em tempo real.

**Objetivo:** Permitir que gestores e RH visualizem em segundos o status completo da equipe.

---

## 📈 Indicadores Principais

### 1. **MÉDIA DA EQUIPE** (Card KPI)
**Localização:** Topo esquerdo  
**Tipo:** Número grande com cor

```
┌─────────────────────┐
│  MÉDIA DA EQUIPE    │
│                     │
│      3.42           │
│   /5.00             │
│ (68% de 4.0)        │
└─────────────────────┘

Fórmula: =AVERAGE(Avaliação_Gestor!E:E)
Cor: Verde se ≥ 3.5 | Amarelo se 3.0-3.4 | Vermelho se < 3.0
Comparação: vs. Expectativa por cargo
```

**Cálculo:**
```excel
=AVERAGEIF(Cadastro!H:H, "Ativo", Avaliação_Gestor!E:E)
```

---

### 2. **EVOLUÇÃO DA EQUIPE** (Card KPI)
**Localização:** Topo centro-esquerdo  
**Tipo:** Percentual com trend

```
┌──────────────────────┐
│  EVOLUÇÃO DA EQUIPE  │
│                      │
│     +8.5%  📈        │
│   vs ciclo anterior  │
│                      │
└──────────────────────┘

Fórmula: =(Média_Atual - Média_Anterior) / Média_Anterior * 100
Indicador: ↑ Verde se positivo | ↓ Vermelho se negativo
```

**Cálculo:**
```excel
=IF(COUNTA(Reavaliação!A:A)=0, "-",
    (AVERAGE(Avaliação_Gestor!E:E) - AVERAGE(Histórico!E:E)) / AVERAGE(Histórico!E:E) * 100)
```

---

### 3. **COMPETÊNCIA MAIS CRÍTICA** (Card KPI)
**Localização:** Topo centro-direito  
**Tipo:** Texto + Cor vermelha

```
┌─────────────────────────┐
│ COMPETÊNCIA CRÍTICA     │
│                         │
│ ⚠️ CAD/CAM              │
│                         │
│ Média: 2.1 (Crítica)   │
└─────────────────────────┘

Competência com menor nota média
Fórmula: Encontra MIN(Avaliação_Gestor.Nota) por competência
Cor: Vermelho (#E74C3C)
```

**Cálculo:**
```excel
=INDEX(Competências!C:C, 
    MATCH(MIN(AVERAGEIF(Avaliação_Gestor!D:D, Competências!A:A, Avaliação_Gestor!E:E)), 
        AVERAGEIF(Avaliação_Gestor!D:D, Competências!A:A, Avaliação_Gestor!E:E), 0))
```

---

### 4. **COMPETÊNCIA MAIS FORTE** (Card KPI)
**Localização:** Topo direito  
**Tipo:** Texto + Cor verde

```
┌─────────────────────────┐
│ COMPETÊNCIA FORTE       │
│                         │
│ ✅ Promob               │
│                         │
│ Média: 4.6 (Excelente) │
└─────────────────────────┘

Competência com maior nota média
Fórmula: Encontra MAX(Avaliação_Gestor.Nota) por competência
Cor: Verde (#27AE60)
```

---

### 5. **GAP MÉDIO** (Card KPI)
**Localização:** Segunda linha esquerda  
**Tipo:** Número + Indicador

```
┌──────────────────────┐
│   GAP MÉDIO          │
│                      │
│   0.3                │
│   (Alinhado)         │
│                      │
└──────────────────────┘

Gap = |Nota_Gestor - Nota_Auto|
Fórmula: =AVERAGE(ABS(Análise_GAP!E:E))
Cor: Verde se = 0 | Amarelo se = ±1 | Vermelho se ≥ ±2
```

---

### 6. **PRONTIDÃO PARA PROMOÇÃO** (Card KPI)
**Localização:** Segunda linha centro-esquerda  
**Tipo:** Contador

```
┌──────────────────────────┐
│ PRONTO PARA PROMOÇÃO     │
│                          │
│    2 colaboradores       │
│                          │
│ • Mateus (Sênior → Líder)│
│ • Pietro (Pleno → Senior)│
└──────────────────────────┘

Critério: Nota_Média ≥ Expectativa_Proximo_Cargo
Fórmula: COUNTIF onde avg(notas) ≥ expectativa
Cor: Verde (#A9DFBF)
```

---

### 7. **TOTAL DE COLABORADORES** (Card KPI)
**Localização:** Segunda linha centro-direito  
**Tipo:** Contador

```
┌──────────────────────┐
│ COLABORADORES ATIVOS │
│                      │
│        5              │
│                      │
│    100% Ativo        │
└──────────────────────┘

Fórmula: =COUNTIF(Cadastro!H:H, "Ativo")
```

---

### 8. **PDI EM ANDAMENTO** (Card KPI)
**Localização:** Segunda linha direita  
**Tipo:** Contador + Status

```
┌──────────────────────┐
│  PDI EM ANDAMENTO    │
│                      │
│        8/12           │
│    (66% concluído)    │
│                      │
└──────────────────────┘

Fórmula: =COUNTIF(PDI!H:H, "Em Andamento") / COUNTA(PDI!H:H)
Barra de progresso visual
```

---

## 📊 Gráficos Principais

### **Gráfico 1: MÉDIA POR COLABORADOR** (Gráfico de Barras)
**Localização:** Topo, ocupa 1/3 da largura  
**Tipo:** Column Chart

```
5.0 │
4.5 │    ██
4.0 │ ██ ██ ██ ██
3.5 │ ██ ██ ██ ██ ██
3.0 │ ██ ██ ██ ██ ██
    └─────────────────
      Pet Vin Tia Mat Lor
      
Eixo X: Nome do colaborador
Eixo Y: Média de notas (1-5)
Cor: Gradiente conforme nota (vermelho → verde)
Linha horizontal: Expectativa por cargo
```

**Dados:**
```
Colaborador | Média (Fórmula)
Pietro      | =AVERAGE(IF(Avaliação_Gestor!$B$:$B$="Pietro", Avaliação_Gestor!E:E))
Vinícius    | =AVERAGE(IF(Avaliação_Gestor!$B$:$B$="Vinícius", Avaliação_Gestor!E:E))
Tiago       | =AVERAGE(IF(Avaliação_Gestor!$B$:$B$="Tiago", Avaliação_Gestor!E:E))
Mateus      | =AVERAGE(IF(Avaliação_Gestor!$B$:$B$="Mateus", Avaliação_Gestor!E:E))
Lorenzo     | =AVERAGE(IF(Avaliação_Gestor!$B$:$B$="Lorenzo", Avaliação_Gestor!E:E))
```

---

### **Gráfico 2: HEATMAP DE COMPETÊNCIAS** (Tabela com Formatação Condicional)
**Localização:** Centro-esquerda, ocupa 1/3 da largura  
**Tipo:** Table + Conditional Formatting

```
                 TEC   EXE   COM   LID   Avg
             ┌─────────────────────────────┐
Pietro       │ 🟢🟢 🟢🟢 🟡🟡 🟢🟡 │ 3.8
Vinícius     │ 🟠🟠 🟡🟡 🟡🟡 🔴🔴 │ 2.4
Tiago        │ 🟢🟡 🟢🟡 🟢🟡 🟡🟡 │ 3.2
Mateus       │ 🟢🟢 🟢🟢 🟢🟢 🟢🟡 │ 4.2
Lorenzo      │ 🟢🟡 🟢🟡 🟡🟡 🟡🟡 │ 3.1

Cor por Nota:
🔴 = 1 (Vermelho)
🟠 = 2 (Laranja)
🟡 = 3 (Amarelo)
🟢 = 4-5 (Verde)
```

**Construção:**
- Linhas: Colaboradores
- Colunas: Categorias (Técnica, Execução, Comportamental, Liderança)
- Valores: Média por categoria
- Formatação: Cores conforme escala 1-5

---

### **Gráfico 3: RADAR (Competências vs Expectativa)**
**Localização:** Centro-direita, ocupa 1/3 da largura  
**Tipo:** Radar Chart

```
              Promob
                ↑
         5 ╱─────────╲
           │         │
        4  │  ╱───╲  │
           │ │ ╱─╲ │ │
        3  │ ││   │ │ │
           │ ││   ││ │
        2  │ ││ X ││ │
           │  │   │  │
        1  │  └───┘  │
           └─────────┘
         
    Legenda:
    ── = Esperado
    ── = Atual (Média)
    
Eixos: 20 Competências (5 grupos)
Valores:
  - Série 1: Expectativa por cargo
  - Série 2: Nota média atual
```

---

### **Gráfico 4: EVOLUÇÃO NO TEMPO** (Gráfico de Linhas)
**Localização:** Inferior esquerda  
**Tipo:** Line Chart

```
5.0 │
4.5 │        ╱╲
4.0 │  ╱╲   ╱  ╲   ╱─
3.5 │ ╱  ╲╱    ╲ ╱
3.0 │╱          ╲
    └──────────────────
      Ciclo 1  Ciclo 2  Ciclo 3
      
Eixo X: Ciclos de avaliação
Eixo Y: Média da equipe
Série por Colaborador (5 linhas)
```

---

### **Gráfico 5: GAP POR COMPETÊNCIA** (Gráfico de Barras Horizontais)
**Localização:** Inferior centro  
**Tipo:** Bar Chart

```
TEC001  ├─────────────────→
TEC002  ├──────────────────→
TEC003  ├─────────────→
EXE001  ├──────→
EXE002  ├─────────────→
...
      -2  -1   0   +1   +2
      
Negativo = Auto > Gestor (modéstia)
Positivo = Gestor > Auto (reconhecimento)
Cor: Vermelho negativo | Verde positivo
```

---

### **Gráfico 6: DISTRIBUIÇÃO DE NOTAS** (Gráfico de Pizza)
**Localização:** Inferior direita  
**Tipo:** Pie Chart

```
      ┌─────────────┐
     ╱  Nota 5: 15% ╲
    │  Nota 4: 45%  │
    │  Nota 3: 30%  │
    │  Nota 2: 8%   │
     ╲  Nota 1: 2%  ╱
      └─────────────┘
      
Fórmula por faixa:
Nota 1: =COUNTIF(Avaliação_Gestor!E:E, 1)
Nota 2: =COUNTIF(Avaliação_Gestor!E:E, 2)
...
Cores: Conforme escala 1-5
```

---

### **Gráfico 7: TOP COLABORADORES** (Ranking)
**Localização:** Lateral direita (coluna)  
**Tipo:** Table + Badges

```
🥇 1º Mateus     4.6 ⭐⭐⭐⭐⭐
🥈 2º Pietro     4.3 ⭐⭐⭐⭐⭐
🥉 3º Lorenzo    3.6 ⭐⭐⭐⭐
   4º Tiago      3.4 ⭐⭐⭐⭐
   5º Vinícius   2.8 ⭐⭐⭐

Ordenação: By Average(Nota_Gestor) DESC
```

---

### **Gráfico 8: COMPETÊNCIAS CRÍTICAS** (Destaque)
**Localização:** Abaixo do Heatmap  
**Tipo:** Badge com lista

```
⚠️ ATENÇÃO - 3 Competências Críticas:
  1. CAD/CAM (Média: 2.1)
  2. Ardis (Média: 2.4)
  3. Aprendizado Contínuo (Média: 2.7)
  
  → PDI recomendado para essas áreas
```

---

### **Gráfico 9: PROGRESSO PDI** (Indicador Visual)
**Localização:** Footer esquerdo  
**Tipo:** Progress Bar

```
PDI Geral: ███░░░░░░░ 60%
  ✅ Concluídos: 8
  ⏳ Em Andamento: 4
  ⬜ Não Iniciados: 2
```

---

### **Gráfico 10: MATRIZ COMPETÊNCIA vs COLABORADOR**
**Localização:** Página 2 (Detalhado)  
**Tipo:** Table com Drill-down

```
Filtros:
 [Cargo] [Competência] [Status] [Ciclo]

Colaborador | Competência | Nota_Auto | Nota_Gestor | GAP | Status
Pietro      | Promob      |    3      |     4       | +1  | ✅
Vinícius    | CAD/CAM     |    1      |     2       | +1  | ⚠️
...
```

---

## 🔄 Atualização Automática

### **Tipo 1: Atualização em Tempo Real**
- Gráficos baseados em **Tabelas Dinâmicas** (Pivot Tables)
- Atualizadas automaticamente quando dados mudam
- Sem necessidade de botão

### **Tipo 2: Atualização com Botão**
```
Botão: "🔄 ATUALIZAR DASHBOARD"
Macro VBA:
  - Atualiza Pivot Tables
  - Recalcula fórmulas
  - Refresca gráficos
  - Exibe mensagem "Atualizado em HH:MM"
```

### **Tipo 3: Atualização Programada**
```
Opção: Atualizar dashboard ao abrir arquivo
VBA no ThisWorkbook:
  - Private Sub Workbook_Open()
  - Executa macro de atualização
```

---

## 🎯 Indicadores de Performance

| Indicador | Bom | Alerta | Crítico |
|-----------|-----|--------|---------|
| Média Equipe | ≥ 3.8 | 3.0-3.7 | < 3.0 |
| Evolução | > +5% | 0-5% | < 0% |
| GAP Médio | ≤ 0.2 | 0.3-0.5 | > 0.5 |
| Pronto Promoção | ≥ 2 | 1 | 0 |
| PDI Concluído | > 80% | 50-80% | < 50% |
| Competência Crítica | > 3.5 | 2.5-3.5 | < 2.5 |

---

## 📋 Checklist de Implementação

- [ ] Criar Tabelas Dinâmicas (Pivot Tables)
- [ ] Formatar Card KPIs
- [ ] Criar Gráfico de Barras (Colaboradores)
- [ ] Criar Heatmap com formatação condicional
- [ ] Criar Gráfico Radar
- [ ] Criar Gráfico de Evolução
- [ ] Criar Gráfico de GAP
- [ ] Criar Gráfico de Pizza
- [ ] Criar Ranking de Colaboradores
- [ ] Criar Badges de Competências Críticas
- [ ] Criar Progress Bar de PDI
- [ ] Implementar botão "Atualizar Dashboard"
- [ ] Testar atualização automática
- [ ] Documentar refresh rate
- [ ] Criar versão impressível (PDF export)

---

## 🖨️ Exportação e Relatórios

### **Relatório PDF Automático**
```
Botão: "📄 GERAR RELATÓRIO"
Conteúdo:
  1. Capa (Data, versão)
  2. Indicadores principais (Cards KPI)
  3. Todos os 10 gráficos
  4. Tabela de rankings
  5. Competências críticas
  6. Recomendações de ação
```

---

**Dashboard Executivo v1.0**  
*Última atualização: Julho 2026*
