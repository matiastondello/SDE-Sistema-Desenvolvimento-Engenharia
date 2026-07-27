# 📊 Análise GAP - SDE

## Visão Geral

A aba **ANÁLISE GAP** **calcula automaticamente** a diferença entre autoavaliação e avaliação do gestor.

**Objetivo:** Identificar divergências de percepção e áreas de desenvolvimento prioritário.

---

## 📊 Estrutura da Tabela

### **Localização:** Aba "ANÁLISE GAP"
**Tipo:** Tabela dinâmica com fórmulas automáticas
**Acesso:** Gestor (leitura), RH/Admin (leitura)

---

## 🔑 Campos da Tabela

| # | Campo | Tipo | Descrição | Fórmula | Exemplo |
|---|-------|------|-----------|---------|----------|
| 1 | **Ciclo** | Número | Ciclo de avaliação | Automática | 1 |
| 2 | **Colaborador** | Texto | Nome do colaborador | Ref. Autoavaliação | Pietro |
| 3 | **ID_Competência** | Texto | Código da competência | Ref. Autoavaliação | TEC001 |
| 4 | **Competência** | Texto | Nome da competência | VLOOKUP | Promob |
| 5 | **Nota Auto** | Número | Autoavaliação | INDEX/MATCH | 3 |
| 6 | **Nota Gestor** | Número | Avaliação Gestor | INDEX/MATCH | 4 |
| 7 | **GAP** | Número | Diferença (Gestor - Auto) | =F-E | +1 |
| 8 | **Classificação** | Texto | Alinhado/Atenção/Divergência | IF(ABS(GAP)=0...) | Atenção |
| 9 | **Nível Esperado** | Número | Expectativa para cargo | INDEX/MATCH | 3.5 |
| 10 | **GAP vs Esperado** | Número | Diferença vs Expectativa | =F-I | +0.5 |
| 11 | **Status Desenvolvimento** | Texto | Acima/Alinhado/Abaixo | IF(G>0...) | Reconhecido |

---

## 🎨 Formatação Visual

### **GAP (Formatação Condicional)**
```
GAP = 0    : 🟢 Verde (#A9DFBF) - Alinhado
GAP = ±1   : 🟡 Amarelo (#F1C40F) - Atenção
GAP ≥ ±2   : 🔴 Vermelho (#E74C3C) - Divergência
```

### **Classificação (Ícones)**
```
✅ Alinhado    : Verde
⚠️ Atenção     : Amarelo
🔴 Divergência : Vermelho
```

### **Status Desenvolvimento**
```
📈 Reconhecido    : Gestor nota mais (+) = crescimento reconhecido
✅ Alinhado       : Notas iguais = visão compartilhada
⚠️ Modéstia       : Auto nota mais (-) = pode estar sendo modesto
❌ Divergência    : GAP ≥ ±2 = necessário conversa
```

---

## 📈 Gráficos de Análise GAP

### **Gráfico 1: Distribuição de GAPs**
```
Alinhados (0): 60% ████████████
Atenção (±1): 30% ██████
Divergência: 10% ██
```

### **Gráfico 2: GAP por Competência**
```
TEC001  ├─────►
TEC002  ├───────►
EXE001  ├──►
COM001  ├────────►
LID001  ├─────────►
        -2  -1  0  +1  +2
```

### **Gráfico 3: GAP por Colaborador**
```
Pietro    ├──► +0.3
Vinícius  ├────► +0.6
Tiago     ├─► +0.1
Mateus    ├─► +0.2
Lorenzo   ├───► +0.5
```

---

## 📊 Indicadores de Alertas

### **Cards no Topo**

```
┌────────────────┬────────────────┬────────────────┐
│ GAP MÉDIO      │ MAIORES GAPS   │ DIVERGÊNCIAS   │
│                │                │                │
│ 0.35           │ CAD/CAM: +1.2  │ Vinícius: +1.5 │
│ ✅ Bom         │ Ardis: +1.1    │ • Precisa diálogo
│ (Alinhado)     │ Qualidade: +0.9│                │
└────────────────┴────────────────┴────────────────┘
```

---

## 🔍 Interpretação de GAPs

### **GAP Positivo (+) - Gestor nota MAIS que Auto**
```
Significado: Colaborador foi reconhecido
Tipo 1: Modéstia - colaborador não se valoriza
Tipo 2: Crescimento - já melhorou desde a autoavaliação
Ação: Reforçar feedback positivo
```

### **GAP Negativo (-) - Colaborador se avalia MAIS**
```
Significado: Autoavaliação acima da realidade
Causa 1: Superestima próprio desempenho
Causa 2: Expectativas não alinhadas
Ação: Conversa sobre realidade vs percepção
```

### **GAP Zero (0) - Totalmente Alinhado**
```
Significado: Perfeito alinhamento
Valor: Visão compartilhada
Ação: Manter e potencializar
```

---

## 📋 Checklist de Implementação

- [ ] Criar tabela com fórmulas de lookup
- [ ] Implementar cálculo de GAP
- [ ] Implementar classificação de GAP
- [ ] Criar formatação condicional
- [ ] Criar gráficos de distribuição
- [ ] Criar cards de alertas
- [ ] Testar com dados exemplo
- [ ] Validar atualização automática
- [ ] Documentar interpretação de GAPs

---

**Análise GAP v1.0**  
*Última atualização: Julho 2026*