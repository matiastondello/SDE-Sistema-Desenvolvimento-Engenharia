'===============================================
' MÓDULO 2: HISTÓRICO E AUDITORIA
' SDE - Sistema de Desenvolvimento da Engenharia
'===============================================

Option Explicit

'===============================================
' SUB: Registrar Evento no Histórico
'===============================================
Sub RegistrarEvento(tipoEvento As String, colaborador As String, _
                   competencia As String, valorAnterior As Variant, _
                   valorNovo As Variant, descricao As String)
    
    Dim ws As Worksheet
    Dim ultimaLinha As Long
    Dim usuario As String
    
    On Error GoTo Erro
    
    Set ws = ThisWorkbook.Sheets("HISTÓRICO")
    
    ' Encontrar próxima linha vazia
    ultimaLinha = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row + 1
    
    ' Tentar obter usuário do sistema
    usuario = Environ("username")
    If usuario = "" Then usuario = "Desconhecido"
    
    ' Preencher dados
    With ws
        .Cells(ultimaLinha, 1).Value = ultimaLinha - 1  ' ID Histórico
        .Cells(ultimaLinha, 2).Value = Now()             ' Data/Hora
        .Cells(ultimaLinha, 5).Value = tipoEvento        ' Tipo Evento
        .Cells(ultimaLinha, 8).Value = colaborador       ' Colaborador
        .Cells(ultimaLinha, 10).Value = competencia      ' Competência
        .Cells(ultimaLinha, 11).Value = valorAnterior    ' Valor Anterior
        .Cells(ultimaLinha, 12).Value = valorNovo        ' Valor Novo
        .Cells(ultimaLinha, 14).Value = usuario          ' Usuário
        .Cells(ultimaLinha, 15).Value = descricao        ' Descrição
        .Cells(ultimaLinha, 16).Value = True             ' Bloqueado (imutável)
    End With
    
    Exit Sub
Erro:
    Call MostrarErro("Erro no Histórico", "Não foi possível registrar o evento.")
End Sub

'===============================================
' SUB: Concluir Autoavaliação
'===============================================
Sub ConcluirAutoavaliacao(colaborador As String)
    Dim wsAuto As Worksheet
    Dim ultimaLinha As Long
    Dim i As Long
    Dim todasPreenchidas As Boolean
    
    On Error GoTo Erro
    
    Set wsAuto = ThisWorkbook.Sheets("AUTOAVALIAÇÃO")
    
    ' Verificar se todas as competências foram preenchidas
    todasPreenchidas = True
    For i = 2 To wsAuto.Cells(wsAuto.Rows.Count, 1).End(xlUp).Row
        If wsAuto.Cells(i, 2).Value = colaborador Then
            If IsEmpty(wsAuto.Cells(i, 5)) Then ' Coluna Nota
                todasPreenchidas = False
                Exit For
            End If
        End If
    Next i
    
    If Not todasPreenchidas Then
        Call MostrarErro("Incompleto", "Todas as 20 competências devem ser preenchidas.")
        Exit Sub
    End If
    
    ' Marcar como concluído
    For i = 2 To wsAuto.Cells(wsAuto.Rows.Count, 1).End(xlUp).Row
        If wsAuto.Cells(i, 2).Value = colaborador And wsAuto.Cells(i, 8).Value <> "Concluído" Then
            wsAuto.Cells(i, 8).Value = "Concluído"
            wsAuto.Cells(i, 8).Interior.Color = RGB(169, 223, 191) ' Verde claro
        End If
    Next i
    
    Call RegistrarEvento("Autoavaliação Concluída", colaborador, "Todas", "-", "Concluído", _
                        "Autoavaliação de " & colaborador & " concluída.")
    
    Call MostrarMensagem("Sucesso", "Autoavaliação de " & colaborador & " concluída com sucesso!")
    
    Exit Sub
Erro:
    Call MostrarErro("Erro", "Não foi possível concluir a autoavaliação.")
End Sub

'===============================================
' SUB: Concluir Avaliação Gestor
'===============================================
Sub ConcluirAvaliacao(colaborador As String)
    Dim wsAval As Worksheet
    Dim i As Long
    Dim todasPreenchidas As Boolean
    
    On Error GoTo Erro
    
    Set wsAval = ThisWorkbook.Sheets("AVALIAÇÃO GESTOR")
    
    ' Verificar se todas as competências foram preenchidas
    todasPreenchidas = True
    For i = 2 To wsAval.Cells(wsAval.Rows.Count, 1).End(xlUp).Row
        If wsAval.Cells(i, 2).Value = colaborador Then
            If IsEmpty(wsAval.Cells(i, 5)) Then ' Coluna Nota Gestor
                todasPreenchidas = False
                Exit For
            End If
        End If
    Next i
    
    If Not todasPreenchidas Then
        Call MostrarErro("Incompleto", "Todas as 20 competências devem ser avaliadas.")
        Exit Sub
    End If
    
    ' Marcar como concluído e bloquear
    For i = 2 To wsAval.Cells(wsAval.Rows.Count, 1).End(xlUp).Row
        If wsAval.Cells(i, 2).Value = colaborador And wsAval.Cells(i, 9).Value <> "Concluído" Then
            wsAval.Cells(i, 9).Value = "Concluído"
            wsAval.Cells(i, 9).Interior.Color = RGB(169, 223, 191) ' Verde claro
            wsAval.Cells(i, 10).Value = True ' Bloqueado
            wsAval.Rows(i).Font.Color = RGB(108, 117, 125) ' Cinza
        End If
    Next i
    
    Call RegistrarEvento("Avaliação Concluída", colaborador, "Todas", "-", "Concluído", _
                        "Avaliação de " & colaborador & " concluída e bloqueada.")
    
    Call MostrarMensagem("Sucesso", "Avaliação de " & colaborador & " concluída e bloqueada!")
    
    Exit Sub
Erro:
    Call MostrarErro("Erro", "Não foi possível concluir a avaliação.")
End Sub

'===============================================
' SUB: Resetar Avaliação (Apenas RH/Admin)
'===============================================
Sub ResetarAvaliacao(colaborador As String)
    Dim resposta As Integer
    Dim wsAval As Worksheet
    Dim i As Long
    
    resposta = MsgBox("Tem certeza que deseja resetar a avaliação de " & colaborador & "?", _
                     vbYesNo + vbWarning)
    
    If resposta = vbNo Then Exit Sub
    
    Set wsAval = ThisWorkbook.Sheets("AVALIAÇÃO GESTOR")
    
    For i = 2 To wsAval.Cells(wsAval.Rows.Count, 1).End(xlUp).Row
        If wsAval.Cells(i, 2).Value = colaborador Then
            wsAval.Cells(i, 5).Value = ""          ' Limpar Nota
            wsAval.Cells(i, 6).Value = ""          ' Limpar Evidência
            wsAval.Cells(i, 9).Value = "Rascunho"  ' Reset Status
            wsAval.Cells(i, 10).Value = False      ' Desbloquear
            wsAval.Rows(i).Font.Color = RGB(0, 0, 0) ' Texto preto
        End If
    Next i
    
    Call MostrarMensagem("Sucesso", "Avaliação de " & colaborador & " resetada.")
End Sub

'===============================================
' FUNÇÃO: Obter Média do Colaborador
'===============================================
Function ObterMediaColaborador(colaborador As String) As Double
    Dim wsAval As Worksheet
    Dim soma As Double
    Dim contador As Integer
    Dim i As Long
    
    Set wsAval = ThisWorkbook.Sheets("AVALIAÇÃO GESTOR")
    soma = 0
    contador = 0
    
    For i = 2 To wsAval.Cells(wsAval.Rows.Count, 1).End(xlUp).Row
        If wsAval.Cells(i, 2).Value = colaborador And Not IsEmpty(wsAval.Cells(i, 5)) Then
            soma = soma + wsAval.Cells(i, 5).Value
            contador = contador + 1
        End If
    Next i
    
    If contador > 0 Then
        ObterMediaColaborador = soma / contador
    Else
        ObterMediaColaborador = 0
    End If
End Function
