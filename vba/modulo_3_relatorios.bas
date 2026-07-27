'===============================================
' MÓDULO 3: GERAÇÃO DE RELATÓRIOS
' SDE - Sistema de Desenvolvimento da Engenharia
'===============================================

Option Explicit

'===============================================
' SUB: Atualizar Dashboard
'===============================================
Sub AtualizarDashboard()
    Dim wsAval As Worksheet
    Dim wsDash As Worksheet
    Dim media As Double
    Dim contador As Integer
    Dim soma As Double
    Dim i As Long
    Dim ultimaLinha As Long
    
    On Error GoTo Erro
    
    Set wsAval = ThisWorkbook.Sheets("AVALIAÇÃO GESTOR")
    Set wsDash = ThisWorkbook.Sheets("DASHBOARD")
    
    ' Calcular média geral
    soma = 0
    contador = 0
    ultimaLinha = wsAval.Cells(wsAval.Rows.Count, 1).End(xlUp).Row
    
    For i = 2 To ultimaLinha
        If Not IsEmpty(wsAval.Cells(i, 5)) Then
            soma = soma + wsAval.Cells(i, 5).Value
            contador = contador + 1
        End If
    Next i
    
    If contador > 0 Then
        media = soma / contador
    Else
        media = 0
    End If
    
    ' Atualizar card de média (célula específica do Dashboard)
    wsDash.Range("B2").Value = Format(media, "0.00")
    
    ' Atualizar timestamp
    wsDash.Range("B3").Value = Now()
    
    ' Recalcular todas as fórmulas
    ThisWorkbook.Calculate
    
    Call MostrarMensagem("Dashboard Atualizado", "Dashboard atualizado em " & Format(Now(), "HH:MM:SS"))
    
    Exit Sub
Erro:
    Call MostrarErro("Erro", "Não foi possível atualizar o dashboard.")
End Sub

'===============================================
' SUB: Gerar Feedforward Automático
'===============================================
Sub GerarFeedforwardAutomatico(colaborador As String)
    Dim wsGap As Worksheet
    Dim wsFeedforward As Worksheet
    Dim i As Long
    Dim ultimaLinha As Long
    Dim novaLinha As Long
    Dim gap As Double
    Dim competencia As String
    
    On Error GoTo Erro
    
    Set wsGap = ThisWorkbook.Sheets("ANÁLISE GAP")
    Set wsFeedforward = ThisWorkbook.Sheets("FEEDFORWARD")
    
    ' Encontrar próxima linha em FEEDFORWARD
    novaLinha = wsFeedforward.Cells(wsFeedforward.Rows.Count, 1).End(xlUp).Row + 1
    
    ' Iterar sobre GAPs
    ultimaLinha = wsGap.Cells(wsGap.Rows.Count, 1).End(xlUp).Row
    
    For i = 2 To ultimaLinha
        If wsGap.Cells(i, 2).Value = colaborador Then
            gap = wsGap.Cells(i, 7).Value ' Coluna GAP
            competencia = wsGap.Cells(i, 4).Value
            
            ' Se GAP >= ±1, sugerir feedforward
            If Abs(gap) >= 1 Then
                With wsFeedforward
                    .Cells(novaLinha, 1).Value = 1             ' Ciclo
                    .Cells(novaLinha, 2).Value = colaborador   ' Colaborador
                    .Cells(novaLinha, 3).Value = wsGap.Cells(i, 3).Value ' ID Competência
                    .Cells(novaLinha, 4).Value = competencia   ' Competência
                    ' Campos para gestor preencher:
                    .Cells(novaLinha, 5).Value = "[Descrever pontos fortes]"
                    .Cells(novaLinha, 6).Value = "[Descrever áreas de desenvolvimento]"
                    .Cells(novaLinha, 7).Value = "[Descrever ações específicas]"
                    .Cells(novaLinha, 8).Value = "[Responsável]"
                    .Cells(novaLinha, 9).Value = Date + 90    ' Prazo: 90 dias
                    .Cells(novaLinha, 10).Value = "Não Iniciado" ' Status
                    .Cells(novaLinha, 12).Value = Now()        ' Data Criação
                End With
                novaLinha = novaLinha + 1
            End If
        End If
    Next i
    
    Call MostrarMensagem("Feedforward Gerado", _
                        "Sugestões de feedforward geradas para " & colaborador & ".")
    
    Exit Sub
Erro:
    Call MostrarErro("Erro", "Não foi possível gerar feedforward automático.")
End Sub

'===============================================
' SUB: Gerar PDI Automático
'===============================================
Sub GerarPDIAutomatico(colaborador As String)
    Dim wsFeedforward As Worksheet
    Dim wsPDI As Worksheet
    Dim i As Long
    Dim ultimaLinha As Long
    Dim novaLinha As Long
    
    On Error GoTo Erro
    
    Set wsFeedforward = ThisWorkbook.Sheets("FEEDFORWARD")
    Set wsPDI = ThisWorkbook.Sheets("PDI")
    
    ' Encontrar próxima linha em PDI
    novaLinha = wsPDI.Cells(wsPDI.Rows.Count, 1).End(xlUp).Row + 1
    
    ' Iterar sobre Feedforward
    ultimaLinha = wsFeedforward.Cells(wsFeedforward.Rows.Count, 1).End(xlUp).Row
    
    For i = 2 To ultimaLinha
        If wsFeedforward.Cells(i, 2).Value = colaborador Then
            With wsPDI
                .Cells(novaLinha, 1).Value = 1                          ' Ciclo
                .Cells(novaLinha, 2).Value = colaborador                ' Colaborador
                .Cells(novaLinha, 3).Value = "Desenvolver: " & _
                                             wsFeedforward.Cells(i, 6).Value ' Objetivo
                .Cells(novaLinha, 4).Value = wsFeedforward.Cells(i, 3).Value ' ID Competência
                .Cells(novaLinha, 6).Value = wsFeedforward.Cells(i, 7).Value ' Ação 1
                .Cells(novaLinha, 9).Value = "[Responsável]"            ' Responsável
                .Cells(novaLinha, 10).Value = Today()                   ' Data Início
                .Cells(novaLinha, 11).Value = Date + 90                ' Data Fim
                .Cells(novaLinha, 12).Value = "Não Iniciado"           ' Status
            End With
            novaLinha = novaLinha + 1
        End If
    Next i
    
    Call MostrarMensagem("PDI Gerado", "PDI gerado para " & colaborador & ".")
    
    Exit Sub
Erro:
    Call MostrarErro("Erro", "Não foi possível gerar PDI automático.")
End Sub

'===============================================
' SUB: Proteger Abas Críticas
'===============================================
Sub ProtegeAbasCriticas()
    Dim senha As String
    
    senha = InputBox("Digite a senha para proteção:", "Proteger Abas")
    
    If senha = "" Then Exit Sub
    
    On Error GoTo Erro
    
    ' Proteger abas
    ThisWorkbook.Sheets("COMPETÊNCIAS").Protect Password:=senha
    ThisWorkbook.Sheets("HISTÓRICO").Protect Password:=senha
    ThisWorkbook.Sheets("CONFIG").Protect Password:=senha
    
    Call MostrarMensagem("Sucesso", "Abas críticas protegidas com sucesso.")
    
    Exit Sub
Erro:
    Call MostrarErro("Erro", "Não foi possível proteger as abas.")
End Sub
