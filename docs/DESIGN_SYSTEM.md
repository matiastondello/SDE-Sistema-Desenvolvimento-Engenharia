# 🎨 Design System - SDE

## Visão Geral da Aparência

O SDE deve parecer um **software corporativo profissional**, não uma planilha. Cada elemento visual foi escolhido para criar uma experiência coerente e intuitiva.

---

## 🎨 Paleta de Cores

### **Cores Primárias**
```
Azul Corporativo:  #1F4788
  Uso: Headers, buttons principais, destaques
  RGB: 31, 71, 136
  
Cinza Moderno:     #6C757D
  Uso: Textos secundários, divisões
  RGB: 108, 117, 125
  
Branco:            #FFFFFF
  Uso: Fundos, áreas de conteúdo
  RGB: 255, 255, 255
  
Cinza Claro:       #ECF0F1
  Uso: Fundos alternativos, linhas
  RGB: 236, 240, 241
```

### **Cores de Status**
```
Verde Sucesso:     #27AE60
  Uso: Nota 5, PDI concluído, ✅ Sucesso
  RGB: 39, 174, 96
  
Verde Claro:       #A9DFBF
  Uso: Nota 4, dados positivos
  RGB: 169, 223, 191
  
Amarelo Alerta:    #F1C40F
  Uso: Nota 3, atenção, rascunho
  RGB: 241, 196, 15
  
Laranja Alerta:    #E67E22
  Uso: Nota 2, gaps, atraso
  RGB: 230, 126, 34
  
Vermelho Crítico:  #E74C3C
  Uso: Nota 1, crítico, erro
  RGB: 231, 76, 60
```

---

## 🔤 Tipografia

### **Fonte Principal**
```
Família: Calibri (padrão Excel)
Alternativa: Arial
Peso: Regular (400)
Tamanho padrão: 11pt
Linha: 1.5
```

### **Hierarquia de Tamanhos**
```
Título Aba (H1):       16pt, negrito, #1F4788
Subtítulo (H2):        14pt, negrito, #1F4788
Header Tabela (H3):    11pt, negrito, branco em #1F4788
Texto Normal:          11pt, regular, #333333
Texto Secundário:      10pt, regular, #6C757D
Rodapé/Info:          9pt, regular, #999999
```

---

## 📏 Layout e Espaçamento

### **Margens**
```
Margem externa:    2cm (todas as abas)
Margem interna:    1cm
Espaço entre seções: 2 linhas em branco
Espaço entre elementos: 1 linha em branco
```

### **Altura de Linhas**
```
Header de tabela:  25pt (25 pixels)
Linhas normais:    20pt (20 pixels)
Cards KPI:         40pt
Espaçadores:       15pt
```

### **Largura de Colunas**
```
Código/ID:         8-10cm
Nome:              15-20cm
Data:              12cm
Nota/Número:       8cm
Texto Descritivo:  20-25cm
```

---

## 🖼️ Elementos Visuais

### **Ícones (Emojis Discretos)**
```
✅ = Concluído, Alinhado, Sucesso
⚠️ = Atenção, Alerta, Cuidado
🔴 = Crítico, Urgente, Erro
🟠 = Alto, Importante
🟡 = Médio, Normal
🟢 = Bom, OK, Positivo
📈 = Crescimento, Evolução
📉 = Queda, Descida
🔒 = Bloqueado, Protegido
🔓 = Desbloqueado
📝 = Editar, Rascunho
📊 = Dados, Gráfico
👥 = Colaborador, Pessoas
💼 = Trabalho, Profissional
🎯 = Objetivo, Meta
```

### **Bordas**
```
Tabelas: Linha 1pt cinza #CCCCCC
Headers: Sem borda inferior
Cards KPI: Borda 1pt #1F4788
Separadores: Linha 1pt cinza #E0E0E0
```

### **Sombra**
```
Cards: Sombra leve (0,5pt offsetY)
Buttons: Sem sombra, hover com 1pt
Tabelas: Sem sombra, alternância de cores
```

---

## 🖥️ Layout de Abas

### **Estrutura Padrão de Aba**

```
┌────────────────────────────────────────────────────────────────┐
│  SDE - SISTEMA DE DESENVOLVIMENTO DA ENGENHARIA               │
│  [Logo/Branding] v1.0  |  Ciclo 1 (2026)  |  15/07/2026       │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  TITULO DA ABA                          [Botões de Ação]       │
│  ───────────────────────────────────────────────────────────  │
│                                                                 │
│  ┌──────────────┬──────────────┬──────────────┐               │
│  │ CARD KPI 1   │ CARD KPI 2   │ CARD KPI 3   │               │
│  │ 100          │ 95%          │ 25 dias      │               │
│  └──────────────┴──────────────┴──────────────┘               │
│                                                                 │
│  ┌────────────────────────────────────────────────────────┐   │
│  │ TABELA OU CONTEÚDO PRINCIPAL                           │   │
│  │                                                         │   │
│  │ Cabeçalho: Azul escuro, texto branco                  │   │
│  │ Linhas: Alternadas branco/cinza claro                 │   │
│  │                                                         │   │
│  └────────────────────────────────────────────────────────┘   │
│                                                                 │
│  [Voltar] [Atualizar] [Salvar] [Exportar PDF]                 │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

---

## 🧊 Congelamento de Painéis

### **Em TODAS as Abas com Tabelas:**
```
Congelar Painel em:
  Primeira coluna: Colaborador/Nome (sempre visível)
  Primeira linha: Headers (sempre visível na rolagem vertical)
  Resultado: 1 coluna + 1 linha congeladas
  Permite: Rolar horizontal e vertical sem perder referência
```

---

## 📊 Formatação de Tabelas

### **Header (Primeira Linha)**
```
Fundo: #1F4788 (Azul corporativo)
Texto: Branco, 11pt, negrito, centralizado
Altura: 25pt
Borda inferior: 2pt #1F4788
Padding vertical: 5pt
Padding horizontal: 8pt
```

### **Linhas Normais**
```
Fundo alternado:
  Par:  #FFFFFF (branco)
  Ímpar: #F8F9FA (cinza muito claro)
  
Texto: #333333, 11pt, regular, alinhado esquerda
Altura: 20pt
Borda: 1pt #E0E0E0 (apenas horizontal)
Padding: 5pt
```

### **Formatação Condicional (Cores)**
```
Célula vermelha: #E74C3C (Nota 1 ou crítico)
Célula laranja:  #E67E22 (Nota 2 ou alerta)
Célula amarela:  #F1C40F (Nota 3 ou atenção)
Célula verde cl: #A9DFBF (Nota 4 ou positivo)
Célula verde ec: #27AE60 (Nota 5 ou sucesso)
```

---

## 🎯 Áreas Editáveis

### **Destaque de Células Editáveis**
```
Com borda destacada:
  Cor: #3498DB (Azul claro)
  Espessura: 2pt
  Efeito: Contorno visível
  
Exemplos:
  - Campos de nota (Autoavaliação, Avaliação Gestor)
  - Campos de comentário
  - Data de Data Início/Fim (PDI)
  - Status (dropdowns)
```

### **Células Bloqueadas**
```
Formatação:
  Fundo: #E8E8E8 (cinza claro)
  Texto: #999999 (cinza)
  Fonte: Cursiva (itálico)
  Sem borda destacada
  Cursor: Proibido (🚫)
```

---

## 📱 Responsividade (Para Futuro Web)

```
Layout Desktop (1920px):
  - 3 colunas de dados
  - Todos os gráficos visíveis
  - Full featured

Layout Tablet (1024px):
  - 2 colunas de dados
  - Gráficos reduzidos
  - Scroll horizontal mínimo

Layout Mobile (480px):
  - 1 coluna de dados
  - Gráficos adaptados
  - Scroll vertical necessário
```

---

## 🔐 Visibilidade vs Privacidade

```
Todo o sistema visualmente claro:
  ✅ Sem informações ocultadas
  ✅ Dados sempre legíveis
  ✅ Hierarquia visual clara
  ✅ Sem células "surpresa"
```

---

## ✅ Checklist de Design

- [ ] Aplicar tema azul corporativo em todos os headers
- [ ] Configurar fonte padrão (Calibri 11pt)
- [ ] Aplicar cores de nota em todas as colunas de avaliação
- [ ] Congelar painéis em todas as abas com tabelas
- [ ] Formatar todas as tabelas (header azul, linhas alternadas)
- [ ] Destacar áreas editáveis (borda azul)
- [ ] Sombrear áreas bloqueadas (cinza)
- [ ] Ajustar largura de colunas
- [ ] Ajustar altura de linhas
- [ ] Remover bordas desnecessárias
- [ ] Adicionar ícones discretos (emojis)
- [ ] Validar consistência visual
- [ ] Testar contraste (legibilidade)
- [ ] Garantir nenhuma célula "solta"
- [ ] Documentar paleta de cores

---

**Design System v1.0**  
*Última atualização: Julho 2026*