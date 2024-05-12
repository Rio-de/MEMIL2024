Attribute VB_Name = "Module3"

Function isInArray(arr() As String, val As String) As Boolean
    Dim i As Integer
    For i = LBound(arr) To UBound(arr)
        If arr(i) = val Then
            isInArray = True
            Exit Function
        End If
    Next i
    isInArray = False
End Function

