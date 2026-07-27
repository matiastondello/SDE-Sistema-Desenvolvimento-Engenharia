# 📜 Histórico - SDE

## Visão Geral

A aba **HISTÓRICO** é a **auditoria completa** do sistema. Registra **TODAS** as ações, mantendo histórico imutável para rastreabilidade total.

**Princípio:** Nunca deletar. Apenas adicionar novos registros.

---

## 📊 Estrutura da Tabela

### **Localização:** Aba "HISTÓRICO"
**Tipo:** Tabela auditoria (INSERT only, nunca UPDATE/DELETE)
**Acesso:** RH/Admin (total), Gestor (leitura)

---

## 🔑 Campos da Tabela

| # | Campo | Tipo | Descrição | Exemplo |
|---|-------|------|-----------|----------|
| 1 | **ID_Histórico** | Inteiro | ID único | 1 |
| 2 | **Data Evento** | Data | Quando aconteceu | 16/07/2026 |
| 3 | **Hora Evento** | Hora | Que horas | 14:32:15 |
| 4 | **Ciclo** | Número | Qual ciclo | 1 |
| 5 | **Tipo Evento** | Texto | O que aconteceu | Autoavaliação Criada |
| 6 | **Ação** | Texto | Criar/Editar/Concluir | Criada |
| 7 | **ID_Colaborador** | Inteiro | Quem foi afetado | 001 |
| 8 | **Nome Colaborador** | Texto | Nome (cópia) | Pietro |
| 9 | **ID_Competência** | Texto | Qual competência | TEC001 |
| 10 | **Competência** | Texto | Nome (cópia) | Promob |
| 11 | **Valor Anterior** | Texto | Antes | 3 |
| 12 | **Valor Novo** | Texto | Depois | 4 |
| 13 | **Campo Alterado** | Texto | Qual campo | Nota Gestor |
| 14 | **Usuário** | Texto | Quem fez | Matias |
| 15 | **Descrição Evento** | Texto | Detalhes | "Avaliação de Promob concluída" |
| 16 | **Bloqueado** | Booleano | Imutável | VERDADEIRO |

---

## 📋 Tipos de Eventos Registrados

```
1. COLABORADOR
   ✓ Novo colaborador adicionado
   ✓ Cargo alterado
   ✓ Dados pessoais editados
   ✓ Status mudado para Inativo
   ✓ Desligamento registrado

2. AUTOAVALIAÇÃO
   ✓ Autoavaliação iniciada (Rascunho)
   ✓ Nota preenchida
   ✓ Autoavaliação concluída
   ✓ Autoavaliação reabererta (RH/Admin)

3. AVALIAÇÃO GESTOR
   ✓ Avaliação iniciada
   ✓ Nota preenchida
   ✓ Avaliação concluída
   ✓ Avaliação desbloqueada (RH/Admin)

4. ANÁLISE GAP
   ✓ GAP calculado
   ✓ Classificação gerada

5. FEEDFORWARD
   ✓ Feedforward criado
   ✓ Feedforward atualizado
   ✓ Status mudou

6. PDI
   ✓ PDI criado
   ✓ Ação adicionada
   ✓ Status atualizado
   ✓ PDI concluído
   ✓ Resultado registrado

7. REAVALIAÇÃO
   ✓ Reavaliação executada
   ✓ Evolução calculada

8. SISTEMA
   ✓ Dashboard atualizado
   ✓ Relatório gerado
   ✓ Arquivo exportado
```

---

## 📊 Gráficos de Auditoria

### **Atividade Timeline**
```
16/07  ████████████ 48 eventos
17/07  ██████ 24 eventos
18/07  ████ 16 eventos
19/07  ██ 8 eventos
20/07  █ 4 eventos
```

### **Eventos por Tipo**
```
Autoavaliação: ████████████░░░░░░ 40%
Avaliação Gest: ████████░░░░░░░░░░ 25%
PDI: ██████░░░░░░░░░░░░░░ 15%
Feedforward: ████░░░░░░░░░░░░░░░░ 12%
Outros: ██░░░░░░░░░░░░░░░░░░░ 8%
```

### **Usuarios mais Ativos**
```
Matias: █████████████░░░░░░░ 65% (117 ações)
Pietro: ██░░░░░░░░░░░░░░░░░░ 10% (18 ações)
Outros: ███░░░░░░░░░░░░░░░░░ 25% (45 ações)
```

---

## 🔍 Filtros e Buscas

```
Filtros disponíveis:
  ☐ Por Datas
  ☐ Por Colaborador
  ☐ Por Tipo Evento
  ☐ Por Usuário
  ☐ Por Competência

Busca:
  Campo de busca textual
  Busca em todos os campos
  Resultados em tempo real
```

---

## 🔐 Proteção de Integridade

```
✅ Proteções:
  - Histórico é APPEND-ONLY (nunca deleta)
  - Timestamp com hora exata
  - Usuário que fez ação registrado
  - Valor anterior E novo preservado
  - Campo Bloqueado = SEMPRE VERDADEIRO

❌ Impossível:
  - Editar registro histórico
  - Deletar registro
  - Alterar usuário/data
```

---

## 📈 Relatórios de Auditoria

### **Relatório 1: Atividade por Colaborador**
```
Pietro:
  - 20 autoavaliações
  - 15 avaliações gestor
  - 8 PDI criados
  - 3 PDI concluídos
  - Progresso: 60%
```

### **Relatório 2: Timeline de Desenvolvimento**
```
Pietro - Evolução:
  Ciclo 1: Auto 3.2 | Gestor 3.4 | GAP +0.2
  Ciclo 2: Auto 3.5 | Gestor 3.8 | GAP +0.3
  → Evolução: +0.4 (12.5% crescimento)
```

### **Relatório 3: Conformidade do Ciclo**
```
Ciclo 1 - Status:
  ✅ 5/5 autoavaliações completas (100%)
  ✅ 5/5 avaliações gestor completas (100%)
  ✅ 5/5 GAPs calculados (100%)
  ⏳ 3/5 PDI criados (60%)
```

---

## 📋 Checklist de Implementação

- [ ] Criar tabela de Histórico
- [ ] Configurar estrutura APPEND-ONLY
- [ ] Implementar triggers VBA para registros automáticos
- [ ] Criar formatação visual
- [ ] Criar gráficos de auditoria
- [ ] Implementar filtros
- [ ] Testar imutabilidade
- [ ] Documentar política de retenção

---

**Histórico v1.0**  
*Última atualização: Julho 2026*