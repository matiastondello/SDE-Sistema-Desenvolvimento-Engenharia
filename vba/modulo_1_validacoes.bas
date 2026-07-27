'===============================================
' MÓDULO 1: VALIDAÇÕES E UTILITÁRIOS
' SDE - Sistema de Desenvolvimento da Engenharia
'===============================================

Option Explicit

' Constantes de cores
Const COR_AZUL_PRINCIPAL As Long = RGB(31, 71, 136)     ' #1F4788
Const COR_VERDE_5 As Long = RGB(39, 174, 96)            ' #27AE60
Const COR_VERDE_4 As Long = RGB(169, 223, 191)          ' #A9DFBF
Const COR_AMARELO_3 As Long = RGB(241, 196, 15)         ' #F1C40F
Const COR_LARANJA_2 As Long = RGB(230, 126, 34)         ' #E67E22
Const COR_VERMELHO_1 As Long = RGB(231, 76, 60)         ' #E74C3C
Const COR_CINZA_CLARO As Long = RGB(236, 240, 241)      ' #ECF0F1
Const COR_CINZA_MEDIO As Long = RGB(108, 117, 125)      ' #6C757D

'===============================================
' FUNÇÃO: Validar Nota (1-5)
'===============================================
Function ValidarNota(valor As Variant) As Boolean
    On Error Resume Next
    ValidarNota = (IsNumeric(valor) And valor >= 1 And valor <= 5)
End Function

'===============================================
' FUNÇÃO: Validar Evidência (mínimo de caracteres)
'===============================================
Function ValidarEvidencia(texto As String, minChars As Integer) As Boolean
    ValidarEvidencia = (Len(Trim(texto)) >= minChars)
End Function

'===============================================
' FUNÇÃO: Verificar se valor é numérico
'===============================================
Function IsNumeric(value As Variant) As Boolean
    On Error Resume Next
    IsNumeric = Not IsError(CDbl(value))
End Function

'===============================================
' SUB: Aplicar cor de nota conforme escala 1-5
'===============================================
Sub AplicarCorNota(celula As Range, nota As Integer)
    Select Case nota
        Case 1
            celula.Interior.Color = COR_VERMELHO_1
        Case 2
            celula.Interior.Color = COR_LARANJA_2
        Case 3
            celula.Interior.Color = COR_AMARELO_3
        Case 4
            celula.Interior.Color = COR_VERDE_4
        Case 5
            celula.Interior.Color = COR_VERDE_5
    End Select
    celula.Font.Bold = True
    celula.HorizontalAlignment = xlCenter
End Sub

'===============================================
' SUB: Formatar Header de Tabela
'===============================================
Sub FormatarHeader(headerRange As Range)
    With headerRange
        .Interior.Color = COR_AZUL_PRINCIPAL
        .Font.Color = RGB(255, 255, 255)
        .Font.Bold = True
        .Font.Size = 11
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .RowHeight = 25
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThick
    End With
End Sub

'===============================================
' SUB: Congelar Painel
'===============================================
Sub CongelarPainel(ws As Worksheet, linha As Integer, coluna As Integer)
    ws.Activate
    ws.Range(ws.Cells(linha, coluna), ws.Cells(linha, coluna)).Select
    ActiveWindow.FreezePanes = True
End Sub

'===============================================
' SUB: Formatar Tabela com cores alternadas
'===============================================
Sub FormatarTabelaAlternada(dataRange As Range)
    Dim row As Long
    Dim cor As Long
    
    For row = 1 To dataRange.Rows.Count
        If row Mod 2 = 0 Then
            cor = COR_CINZA_CLARO
        Else
            cor = RGB(255, 255, 255)
        End If
        dataRange.Rows(row).Interior.Color = cor
    Next row
End Sub

'===============================================
' SUB: Criar Dropdown List
'===============================================
Sub CriarDropdown(celula As Range, items As String)
    With celula.Validation
        .Delete
        .Type = xlList
        .Formula1 = items
        .IgnoreBlank = False
        .InCellDropdown = True
        .ShowError = True
        .AlertStyle = xlValidAlertWarning
    End With
End Sub

'===============================================
' FUNÇÃO: Calcular GAP
'===============================================
Function CalcularGAP(notaAuto As Double, notaGestor As Double) As Double
    If IsEmpty(notaAuto) Or IsEmpty(notaGestor) Then
        CalcularGAP = 0
    Else
        CalcularGAP = notaGestor - notaAuto
    End If
End Function

'===============================================
' FUNÇÃO: Classificar GAP
'===============================================
Function ClassificarGAP(gap As Double) As String
    If gap = 0 Then
        ClassificarGAP = "✅ Alinhado"
    ElseIf Abs(gap) = 1 Then
        ClassificarGAP = "⚠️ Atenção"
    ElseIf Abs(gap) >= 2 Then
        ClassificarGAP = "🔴 Divergência"
    Else
        ClassificarGAP = ""
    End If
End Function

'===============================================
' FUNÇÃO: Calcular Progresso PDI (%)
'===============================================
Function CalcularProgressoPDI(dataInicio As Date, dataFim As Date) As Double
    Dim hoje As Date
    hoje = Today()
    
    If dataFim < hoje Then
        CalcularProgressoPDI = 100
    ElseIf dataInicio > hoje Then
        CalcularProgressoPDI = 0
    Else
        CalcularProgressoPDI = (hoje - dataInicio) / (dataFim - dataInicio) * 100
    End If
End Function

'===============================================
' SUB: Mensagem de sucesso
'===============================================
Sub MostrarMensagem(titulo As String, mensagem As String)
    MsgBox mensagem, vbInformation, titulo
End Sub

'===============================================
' SUB: Mensagem de erro
'===============================================
Sub MostrarErro(titulo As String, mensagem As String)
    MsgBox mensagem, vbCritical, titulo
End Sub
