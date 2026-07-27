# 🎯 Feedforward - SDE

## Visão Geral

A aba **FEEDFORWARD** gera recomendações de **próximos passos** e **ações de desenvolvimento** focadas no futuro, não no passado.

**Filosofia:** Feedforward, não feedback. "Para onde vamos?" em vez de "Como você foi?"

---

## 📊 Estrutura da Tabela

### **Localização:** Aba "FEEDFORWARD"
**Tipo:** Tabela com recomendações estruturadas
**Acesso:** Gestor (criação), Colaborador (leitura)

---

## 🔑 Campos da Tabela

| # | Campo | Tipo | Obrigatório | Descrição | Exemplo | Validação |
|---|-------|------|-------------|-----------|---------|--------|
| 1 | **Ciclo** | Número | ✅ | Ciclo de avaliação | 1 | 1-2 |
| 2 | **Colaborador** | Dropdown | ✅ | Quem receberá | Pietro | Ref. CADASTRO |
| 3 | **ID_Competência** | Texto | ✅ | Competência | TEC001 | Ref. COMPETÊNCIAS |
| 4 | **Competência** | Texto | ✅ | Nome | Promob | Automática |
| 5 | **Pontos Fortes** | Texto | ✅ | O que faz bem | "Executa com precisão" | Min 20 chars |
| 6 | **Áreas Desenvolv.** | Texto | ✅ | O que melhorar | "Mentorar iniciantes" | Min 20 chars |
| 7 | **Compromissos** | Texto | ✅ | Ações específicas | "Treinar 2 pessoas" | Min 30 chars |
| 8 | **Responsável** | Dropdown | ✅ | Quem acompanha | Matias | Ref. CADASTRO |
| 9 | **Prazo** | Data | ✅ | Data limite | 31/10/2026 | Futura |
| 10 | **Status** | Dropdown | ✅ | Progresso | Em Andamento | Não/Prog/Concl |
| 11 | **Comentários** | Texto | ⚠️ | Notas adicionais | "Focus em liderança" | Max 200 |
| 12 | **Data Criação** | Data | ✅ | Quando criado | 16/07/2026 | Automática |

---

## 🎨 Formatação Visual

### **Status (Cores)**
```
🟡 Não Iniciado    : Amarelo (#F1C40F)
🟠 Em Andamento    : Laranja (#E67E22)
🟢 Concluído       : Verde (#A9DFBF)
```

### **Linguagem (Checklist)**
```
✅ Permitido:
  - "Desenvolver", "Melhorar", "Aprender"
  - "Próximo passo", "Futuro"
  - "Oportunidade", "Crescimento"
  - Frases positivas

❌ Proibido:
  - "Deficiente", "Fraco", "Ruim"
  - "Falhou", "Errou", "Não consegue"
  - Críticas
  - Linguagem de julgamento
```

---

## 📝 Exemplo de Feedforward

```
Colaborador: Pietro
Competência: Promob

Pontos Fortes:
  "Você domina muito bem o software e executa projetos
   com precisão impressionante."

Áreas de Desenvolvimento:
  "Mentoraria de colegas iniciantes seria o próximo
   nível de maestria."

Compromisos (Ações Específicas):
  1. Preparar workshop sobre Promob avançado
  2. Mentorar Vinícius durante 1 mês
  3. Documentar best practices

Responsável: Matias
Prazo: 31/10/2026
Status: Em Andamento
```

---

## 🔄 Fluxo de Criação

### **Passo 1: Seletor de Colaborador**
```
Dropdown: [Selecione colaborador ▼]
```

### **Passo 2: Competências com GAP**
```
Sistema mostra apenas competências com GAP ≥ ±1
(Não mostra competências alinhadas)
```

### **Passo 3: Preenchimento**
```
1. Pontos Fortes: O que colaborador faz bem?
2. Áreas Desenvolv.: Qual seria o próximo nível?
3. Compromissos: Quais ações específicas?
4. Responsável: Quem vai acompanhar?
5. Prazo: Quando será concluído?
```

### **Passo 4: Geração Automática (Botão)**
```
Botão: "Gerar Sugestões de Feedforward"

Sistema gera automaticamente:
- Analisando GAPs
- Usando histórico de evolução
- Sugerindo próximos passos
- Usuário aprova/edita/salva
```

---

## 📋 Checklist de Implementação

- [ ] Criar tabela de Feedforward
- [ ] Configurar validações de linguagem
- [ ] Criar formatação visual
- [ ] Implementar gerador automático
- [ ] Testar com todos os colaboradores
- [ ] Validar filtro de competências

---

**Feedforward v1.0**  
*Última atualização: Julho 2026*