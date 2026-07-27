# 🚀 Guia de Implementação - SDE v1.0

## Visão Geral

Este guia fornece instruções passo-a-passo para **montar o Workbook Excel completo** do SDE.

**Tempo estimado:** 40-50 horas (desenvolvimento profissional)

---

## 📋 Fase 1: Preparação (2-4 horas)

### Passo 1: Criar novo Workbook Excel
```
1. Abra Excel
2. Crie novo arquivo em branco
3. Salve como: SDE_v1.0.xlsx
4. Locação: C:\Projetos\SDE\ (recomendado)
```

### Passo 2: Criar as Abas
```
Clique direito na aba "Plan1":
1. HOME
2. CADASTRO
3. COMPETÊNCIAS
4. AUTOAVALIAÇÃO
5. AVALIAÇÃO GESTOR
6. ANÁLISE GAP
7. FEEDFORWARD
8. PDI
9. REAVALIAÇÃO
10. HISTÓRICO
11. DASHBOARD
12. CONFIG (protegida)
```

### Passo 3: Configurar Temas
```
Aba Design:
1. Cores → Personalizar
2. Selecione cores corporativas
3. Fontes → Calibri 11pt
4. Salve como Tema: SDE_Corporativo.thmx
```

---

## 📊 Fase 2: Tabela de Cadastro (3-4 horas)

### Aba: CADASTRO

**Estrutura:**
```
Coluna A: Código (001-005)
Coluna B: Nome
Coluna C: Cargo Atual
Coluna D: Próximo Cargo
Coluna E: Gestor
Coluna F: Data Admissão
Coluna G: Área
Coluna H: Status
Coluna I: Data Cadastro
Coluna J: Observações
```

**Dados Iniciais:**
```
001 | Matias    | Coordenador | -          | -      | 01/01/2020 | Eng | Ativo | 15/07/2026 | RH/Admin
002 | Pietro    | Pleno       | Sênior     | Matias | 01/01/2022 | Eng | Ativo | 15/07/2026 | -
003 | Vinícius  | Trainee     | Pleno      | Matias | 15/03/2023 | Eng | Ativo | 15/07/2026 | -
004 | Tiago     | Pleno       | Sênior     | Matias | 10/06/2021 | Eng | Ativo | 15/07/2026 | -
005 | Mateus    | Sênior      | Líder      | Matias | 01/02/2020 | Eng | Ativo | 15/07/2026 | -
006 | Lorenzo   | Pleno       | Sênior     | Matias | 20/08/2022 | Eng | Ativo | 15/07/2026 | -
```

**Validações:**
```
Cargo Atual: Data Validation → List → Trainee, Pleno, Sênior, Líder
Proximo Cargo: Idem
Gestor: Data Validation → List → =CADASTRO[Nome]
Status: Data Validation → List → Ativo, Inativo, Licença, Desligado
Data Admissão: Data Validation → Date → not>(TODAY())
```

**Formatação:**
```
Header (linha 1):
  Fundo: #1F4788
  Texto: Branco, negrito
  Altura: 25pt

Linhas normais:
  Alternadas: Branco / #F8F9FA
  Altura: 20pt

Congelar Painel: Linha 1 e Coluna A
```

---

## 🧠 Fase 3: Tabela de Competências (2-3 horas)

### Aba: COMPETÊNCIAS

**Estrutura:**
```
Coluna A: Código (TEC001-LID005)
Coluna B: Nome
Coluna C: Categoria
Coluna D: Objetivo
Coluna E: Peso
Coluna F: Descrição
Coluna G: Nível Trainee
Coluna H: Nível Pleno
Coluna I: Nível Sênior
Coluna J: Nível Líder
Coluna K: Status
```

**20 Competências (copiar de COMPETENCIAS_ESPECIFICACAO.md):**
- TEC001 a TEC005 (Técnicas)
- EXE001 a EXE005 (Execução)
- COM001 a COM005 (Comportamental)
- LID001 a LID005 (Liderança)

**Validações:**
```
Categoria: Data Validation → List → Técnica, Execução, Comportamental, Liderança
Nível *: Data Validation → Decimal → Between 1 and 5
Status: Data Validation → List → Ativo, Inativo
```

**Proteção:**
```
Formato → Proteger Aba
  Opções permitidas:
    ☐ Selecionar células bloqueadas
    ☐ Selecionar células desbloqueadas
  
  Senha: [escolher senha forte]
```

---

## ✍️ Fase 4: Autoavaliação (4-5 horas)

### Aba: AUTOAVALIAÇÃO

**Estrutura (100 linhas = 5 colab × 20 competências):**
```
Coluna A: Ciclo
Coluna B: Colaborador
Coluna C: ID_Competência
Coluna D: Competência
Coluna E: Nota Auto
Coluna F: Comentário
Coluna G: Data Auto
Coluna H: Status
```

**Criar Template:**
```
Para cada colaborador (Pietro, Vinícius, Tiago, Mateus, Lorenzo):
  Para cada competência (TEC001 - LID005):
    1. Ciclo = 1
    2. Colaborador = [nome]
    3. ID_Competência = [código]
    4. Competência = VLOOKUP(C, COMPETÊNCIAS, 2)
    5. Nota Auto = [vazio - usuário preenche]
    6. Comentário = [vazio - usuário preenche]
    7. Data Auto = TODAY()
    8. Status = "Rascunho"
```

**Validações:**
```
Nota Auto: Data Validation → Whole Number → Between 1 and 5
Comentário: Data Validation → Text Length → >=20
Status: Data Validation → List → Rascunho, Concluído
```

**Formatação Condicional:**
```
Nota Auto:
  1 = #E74C3C (Vermelho)
  2 = #E67E22 (Laranja)
  3 = #F1C40F (Amarelo)
  4 = #A9DFBF (Verde claro)
  5 = #27AE60 (Verde escuro)

Status:
  "Rascunho" = #F1C40F (Amarelo)
  "Concluído" = #A9DFBF (Verde claro)
```

---

## 👔 Fase 5: Avaliação Gestor (4-5 horas)

### Aba: AVALIAÇÃO GESTOR

**Estrutura idêntica à AUTOAVALIAÇÃO, mas:**
```
Coluna E: Nota Gestor (em vez de Nota Auto)
Coluna F: Evidência (em vez de Comentário)
Coluna G: Comentário Adicional
Coluna H: Data Avaliação
Coluna I: Status
Coluna J: Bloqueado
```

**Validações:**
```
Nota Gestor: Data Validation → Whole Number → Between 1 and 5
Evidência: Data Validation → Text Length → >=30
Status: Data Validation → List → Rascunho, Concluído
Bloqueado: Fórmula = IF(I="Concluído", TRUE, FALSE)
```

**Formatação Condicional:**
```
Mesmas cores de AUTOAVALIAÇÃO
Bloqueado = #E8E8E8 (cinza claro)
```

---

## 📊 Fase 6: Análise GAP (3-4 horas)

### Aba: ANÁLISE GAP

**Estrutura (100 linhas automáticas):**
```
Coluna A: Ciclo
Coluna B: Colaborador
Coluna C: ID_Competência
Coluna D: Competência
Coluna E: Nota Auto = INDEX/MATCH(AUTOAVALIAÇÃO)
Coluna F: Nota Gestor = INDEX/MATCH(AVALIAÇÃO_GESTOR)
Coluna G: GAP = F-E
Coluna H: Classificação GAP = IF(ABS(G)=0,"Alinhado",IF(ABS(G)=1,"Atenção","Divergência"))
Coluna I: Nível Esperado = INDEX/MATCH(COMPETÊNCIAS)
Coluna J: GAP vs Esperado = F-I
```

**Fórmulas Críticas:**
```excel
=INDEX(Autoavaliação[Nota Auto],
       MATCH(1, (Autoavaliação[Colaborador]=$B2)*(Autoavaliação[ID_Competência]=$C2), 0))

=IF(ABS(G2)=0, "✅ Alinhado",
    IF(ABS(G2)=1, "⚠️ Atenção",
       IF(ABS(G2)>=2, "🔴 Divergência", "")))
```

**Cards Superiores:**
```
GAP Médio = AVERAGE(ABS(G:G))
Maior GAP = MAX(G:G)
Menor GAP = MIN(G:G)
Divergências = COUNTIF(H:H, "Divergência")
```

**Gráficos:**
```
1. Gráfico Pizza: Distribuição de GAPs
2. Gráfico Barras Horiz: GAP por Competência
3. Gráfico Barras Vert: GAP por Colaborador
```

---

## 🎯 Fase 7: Feedforward (3-4 horas)

### Aba: FEEDFORWARD

**Estrutura:**
```
Coluna A: Ciclo
Coluna B: Colaborador
Coluna C: ID_Competência
Coluna D: Competência
Coluna E: Pontos Fortes
Coluna F: Áreas Desenvolv.
Coluna G: Compromissos
Coluna H: Responsável
Coluna I: Prazo
Coluna J: Status
Coluna K: Comentários
Coluna L: Data Criação
```

**Validações:**
```
Pontos Fortes: Text Length >= 20
Áreas Desenvolv: Text Length >= 20
Compromisos: Text Length >= 30
Responsável: List = CADASTRO[Nome]
Prazo: Date > TODAY()
Status: List = Não Iniciado, Em Andamento, Concluído
```

**Formatação:**
```
Status cores:
  "Não Iniciado" = #F1C40F (Amarelo)
  "Em Andamento" = #E67E22 (Laranja)
  "Concluído" = #A9DFBF (Verde)
```

---

## 📋 Fase 8: PDI (4-5 horas)

### Aba: PDI

**Estrutura:**
```
Coluna A: Ciclo
Coluna B: Colaborador
Coluna C: Objetivo
Coluna D: ID_Competência
Coluna E: Competência
Coluna F: Ação 1
Coluna G: Ação 2 (opcional)
Coluna H: Ação 3 (opcional)
Coluna I: Responsável
Coluna J: Data Início
Coluna K: Data Fim
Coluna L: Status
Coluna M: Progresso %
Coluna N: Data Conclusão (opcional)
Coluna O: Resultado (opcional)
Coluna P: Nota Inicial
Coluna Q: Nota Final
Coluna R: Evolução
```

**Fórmula de Progresso:**
```excel
=IF(K2<TODAY(), 100,
    IF(J2>TODAY(), 0,
       (TODAY()-J2)/(K2-J2)*100))
```

**Gráficos:**
```
1. Barra Progresso por PDI
2. Gráfico Pizza: PDI por Status
3. Gráfico Barras: Evolução por Colaborador
```

---

## 📊 Fase 9: Dashboard (5-6 horas)

### Aba: DASHBOARD

**Cards KPIs (topo):**
```
Média da Equipe = AVERAGE(Avaliação_Gestor[Nota])
Evolução = (Média_Atual - Média_Anterior) / Média_Anterior * 100
Competência Crítica = INDEX(COMPETÊNCIAS[Nome], MATCH(MIN(...), ...))
Competência Forte = INDEX(COMPETÊNCIAS[Nome], MATCH(MAX(...), ...))
GAP Médio = AVERAGE(ABS(Análise_GAP[GAP]))
Promoção Pronta = COUNTIF(onde Média >= Expectativa Próximo Cargo)
PDI Andamento = COUNTIF(PDI[Status], "Em Andamento")
```

**Gráficos (10 no total):**
```
1. Barras: Média por Colaborador
2. Heatmap: Competências x Colaboradores
3. Radar: Competências vs Expectativa
4. Linhas: Evolução no Tempo
5. Barras Horiz: GAP por Competência
6. Pizza: Distribuição de Notas
7. Ranking: Top Colaboradores
8. Badges: Competências Críticas
9. Progresso: PDI
10. Tabela Drill-down: Matriz Competência-Colaborador
```

**Botão: Atualizar Dashboard**
```
Macro VBA:
  Sub AtualizarDashboard()
    ThisWorkbook.RefreshAll
    MsgBox "Dashboard atualizado em " & Format(Now, "HH:MM")
  End Sub
```

---

## 🔐 Fase 10: VBA e Automações (6-8 horas)

### Criar Módulos VBA

**Module 1: Validação**
```vba
Function ValidarNota(valor As Variant) As Boolean
  ValidarNota = (valor >= 1 And valor <= 5)
End Function

Function ValidarEvidencia(texto As String) As Boolean
  ValidarEvidencia = (Len(texto) >= 30)
End Function
```

**Module 2: Histórico**
```vba
Sub RegistrarEvento(colaborador As String, evento As String, detalhes As String)
  Dim ws As Worksheet
  Set ws = ThisWorkbook.Sheets("HISTÓRICO")
  
  Dim ultimaLinha As Long
  ultimaLinha = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row + 1
  
  ws.Cells(ultimaLinha, 2) = Now 'Data/Hora
  ws.Cells(ultimaLinha, 5) = evento
  ws.Cells(ultimaLinha, 8) = colaborador
  ws.Cells(ultimaLinha, 14) = detalhes
  ws.Cells(ultimaLinha, 16) = TRUE 'Bloqueado
End Sub
```

**Module 3: Botões**
```vba
Sub ConcluirAutoavaliacao()
  'Validar todas as notas
  'Bloquear edição
  'Registrar no histórico
  'Mensagem de confirmação
End Sub

Sub ConcluirAvaliacao()
  'Idem Autoavaliacao
End Sub

Sub GerarFeedforward()
  'Analisar GAPs
  'Gerar sugestões
  'Sugerir próximos passos
End Sub

Sub GerarPDI()
  'Baseado em Feedforward
  'Sugerir ações
  'Preencher PDI
End Sub

Sub ExportarPDF()
  'Gerar relatório
  'Salvar em PDF
  'Abrir arquivo
End Sub
```

---

## 🎨 Fase 11: Design e Formatação (4-6 horas)

**Aplicar em TODAS as abas:**

1. **Headers:**
   - Fundo: #1F4788
   - Texto: Branco, 11pt, negrito
   - Altura: 25pt
   - Borda: 2pt inferior

2. **Tabelas:**
   - Linhas alternadas: Branco / #F8F9FA
   - Altura: 20pt
   - Borda: 1pt #E0E0E0
   - Congelar painel: Linha 1 + Coluna A

3. **Formatação Condicional:**
   - Notas: cores 1-5
   - Status: cores específicas
   - Bloqueado: cinza #E8E8E8

4. **Ícones:**
   - ✅ Concluído
   - ⚠️ Atenção
   - 🔴 Crítico
   - 🎯 Objetivo
   - 📈 Crescimento

---

## 🔒 Fase 12: Segurança (2-3 horas)

**Proteger Abas:**
```
ABAS PROTEGIDAS:
- COMPETÊNCIAS
- CONFIG
- HISTÓRICO (proteção contra exclusão)

OPÇÕES DE PROTEÇÃO:
  ☑ Selecionar células
  ☐ Editar conteúdo
  ☐ Formatar células
  ☑ Usar classificação automática
  ☑ Usar filtros automáticos
```

**Proteger VBA:**
```
Tools → VBA Project Properties
  Protection tab
  ☑ Lock project for viewing
  [Senha]
```

**Proteger Fórmulas:**
```
Selecione todas as células com fórmulas
Format → Cells → Protection → ☑ Hidden
Proteja a aba (acima)
```

---

## ✅ Fase 13: Testes (4-5 horas)

**Teste Funcional:**
```
1. ✅ Adicionar colaborador em CADASTRO
2. ✅ Preencher Autoavaliação (1 colaborador, 20 competências)
3. ✅ Concluir Autoavaliação (bloquear edição)
4. ✅ Preencher Avaliação Gestor
5. ✅ Concluir Avaliação Gestor (bloquear)
6. ✅ Verificar GAP calculado automaticamente
7. ✅ Gerar Feedforward
8. ✅ Criar PDI
9. ✅ Atualizar Dashboard
10. ✅ Verificar Histórico
11. ✅ Exportar PDF
12. ✅ Teste com 5 colaboradores
```

**Teste de Integridade:**
```
1. ✅ Validações funcionam
2. ✅ Fórmulas atualizam automaticamente
3. ✅ Bloqueios funcionam
4. ✅ Histórico registra tudo
5. ✅ Gráficos atualizam
6. ✅ Nenhuma célula "solta"
7. ✅ Nenhum erro de fórmula
```

---

## 📚 Documentação Final (2-3 horas)

```
1. GUIA DO USUÁRIO (para Gestor)
2. GUIA DO USUÁRIO (para Colaborador)
3. GUIA DO ADMINISTRADOR (RH/Admin)
4. FAQ (Perguntas Frequentes)
5. TROUBLESHOOTING (Solução de problemas)
```

---

## 📦 Entrega Final

**Arquivo:**
```
SDE_v1.0.xlsx (50-100 MB)
  - 12 abas completas
  - 20 competências
  - 100 linhas de dados (5 colab × 20 compet)
  - 10 gráficos
  - VBA com 20+ macros
  - Design corporativo
  - Proteção de segurança
```

**Documentação:**
```
Docs/ folder:
  - README.md
  - ARQUITETURA.md
  - DICIONARIO_DADOS.md
  - DASHBOARD_EXECUTIVO.md
  - DASHBOARD_INDIVIDUAL.md
  - DESIGN_SYSTEM.md
  - GUIA_USUARIO.md
  - GUIA_ADMIN.md
```

---

**Total: 40-50 horas de desenvolvimento profissional**

*Última atualização: Julho 2026*
