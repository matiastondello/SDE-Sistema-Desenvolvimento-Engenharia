# 📋 PDI - Plano de Desenvolvimento Individual - SDE

## Visão Geral

A aba **PDI** é o **plano de ação** de cada colaborador. Transforma insights do GAP e Feedforward em objetivos concretos com prazos e acompanhamento.

**Objetivo:** Criar um roadmap claro de desenvolvimento para cada pessoa.

---

## 📊 Estrutura da Tabela

### **Localização:** Aba "PDI"
**Tipo:** Tabela com acompanhamento de progresso
**Acesso:** Colaborador (edição própria), Gestor (leitura), RH/Admin (total)

---

## 🔑 Campos da Tabela

| # | Campo | Tipo | Obrigatório | Descrição | Exemplo | Validação |
|---|-------|------|-------------|-----------|---------|----------|
| 1 | **Ciclo** | Número | ✅ | Ciclo de criação | 1 | 1-2 |
| 2 | **Colaborador** | Dropdown | ✅ | Quem será desenvolvido | Pietro | Ref. CADASTRO |
| 3 | **Objetivo** | Texto | ✅ | Objetivo do PDI | Dominar Promob avançado | Min 30 chars |
| 4 | **ID_Competência** | Texto | ✅ | Competência relacionada | TEC001 | Ref. COMPETÊNCIAS |
| 5 | **Competência** | Texto | ✅ | Nome da competência | Promob | Automática |
| 6 | **Ação 1** | Texto | ✅ | Ação específica | Realizar treinamento | Min 20 chars |
| 7 | **Ação 2** | Texto | ⚠️ | Ação complementar | Estudar documentação | Opcional |
| 8 | **Ação 3** | Texto | ⚠️ | Ação extra | Praticar em projetos | Opcional |
| 9 | **Responsável** | Dropdown | ✅ | Quem acompanha | Matias | Ref. CADASTRO |
| 10 | **Data Início** | Data | ✅ | Quando começa | 17/07/2026 | Hoje() ou futura |
| 11 | **Data Fim** | Data | ✅ | Prazo final | 30/09/2026 | Maior que Início |
| 12 | **Status** | Dropdown | ✅ | Progresso | Em Andamento | Não/Prog/Concl |
| 13 | **Progresso %** | Número | ✅ | Percentual | 50% | Automática |
| 14 | **Data Conclusão** | Data | ⚠️ | Quando foi concluído | 28/09/2026 | Se Concluído |
| 15 | **Resultado** | Texto | ⚠️ | Resultado obtido | Certificado obtido | Se Concluído |
| 16 | **Nota Inicial** | Número | ⚠️ | Nota antes | 3 | Ref. Autoavaliação |
| 17 | **Nota Final** | Número | ⚠️ | Nota depois | 4 | Ref. Reavaliação |
| 18 | **Evolução** | Número | ⚠️ | Progresso | +1 (33%) | Fórmula |

---

## 🎨 Formatação Visual

### **Status (Cores)**
```
⬜ Não Iniciado  : Cinza (#95A5A6)
🟠 Em Andamento  : Laranja (#E67E22)
🟢 Concluído     : Verde (#27AE60)
```

### **Barra de Progresso**
```
Fórmula: (TODAY() - Data_Início) / (Data_Fim - Data_Início) * 100

Visualização:
████████░░░░░░░░░░░░ 50%

Cores:
< 25%  : 🔴 Vermelho (atrasado?)
25-50% : 🟠 Laranja (no prazo)
50-75% : 🟡 Amarelo (mais da metade)
> 75%  : 🟢 Verde (quase concluído)
```

---

## 📊 Cards no Topo

```
┌──────────────┬──────────────┬──────────────┐
│ PDI ATIVO    │ PDI CONCLUÍDO│ PROGRESSO    │
│              │              │              │
│ 12 em curso  │ 8 concluídos │ ███░░░░░░ 63%│
│ (60%)        │ (40%)        │ (12/19)      │
└──────────────┴──────────────┴──────────────┘
```

---

## 🔄 Fluxo de Criação

### **Passo 1: Seleção de Colaborador**
```
Dropdown: [Selecione colaborador ▼]
```

### **Passo 2: Objetivo e Competência**
```
1. Digite objetivo (ex: "Dominar CAD/CAM avançado")
2. Selecione competência relacionada
3. Sistema traz histórico de notas
```

### **Passo 3: Ações Específicas**
```
1. Ação principal (obrigatória)
2. Ação complementar (opcional)
3. Ação extra (opcional)

Exemplo:
- Ação 1: "Realizar curso CAD/CAM 40h"
- Ação 2: "Participar de 5 projetos"
- Ação 3: "Mentorar colega iniciante"
```

### **Passo 4: Prazos e Responsável**
```
1. Data de Início (padrão: hoje)
2. Data de Fim (máx 12 meses)
3. Responsável (gestor ou outro)
```

### **Passo 5: Acompanhamento**
```
Status atualizado mensalmente:
- Não Iniciado
- Em Andamento (com progresso %)
- Concluído (com resultado)
```

---

## 📈 Gráficos PDI

### **Gráfico 1: PDI por Status**
```
Concluído     ████░░░░░░ 40%
Em Andamento  ██████░░░░ 60%
Não Iniciado  ░░░░░░░░░░ 0%
```

### **Gráfico 2: Evolução por Colaborador**
```
Pietro    ████████████████░░░░ 80% (4/5 PDI)
Vinícius  ██░░░░░░░░░░░░░░░░░░ 10% (1/10 PDI)
Tiago     ██████████░░░░░░░░░░ 50% (2/4 PDI)
Mateus    ████████████████████ 100% (3/3 PDI)
Lorenzo   ███░░░░░░░░░░░░░░░░░ 15% (1/7 PDI)
```

---

## 📋 Checklist de Implementação

- [ ] Criar tabela PDI
- [ ] Implementar cálculo de progresso %
- [ ] Criar formatação de barra de progresso
- [ ] Implementar formatação condicional por status
- [ ] Criar gráficos de PDI
- [ ] Testar com dados exemplo
- [ ] Validar atualização automática de %
- [ ] Documentar instruções de uso

---

**PDI v1.0**  
*Última atualização: Julho 2026*