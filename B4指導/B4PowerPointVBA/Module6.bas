Attribute VB_Name = "Module6"
Sub Font_Calibri()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundNonCalibriFont As Boolean
    
    ' スライドごとに処理
    For Each slide In ActivePresentation.Slides
        ' スライド内のすべてのシェイプに対して処理
        For Each shape In slide.Shapes
            ' テキストボックスの場合のみ処理
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' Calibri以外のフォントを検出してコメントを追加
                If Not textRange.Font.Name = "Calibri" Then
                    ' コメントのテキストを設定
                    commentText = "Calibri以外のフォントが使用されています。"
                    ' コメントを追加
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundNonCalibriFont = True
                End If
            End If
        Next shape
    Next slide
    
    ' Calibri以外のフォントが見つからなかった場合の処理
    If Not foundNonCalibriFont Then
        MsgBox "Calibri以外のフォントは使用されていません。", vbInformation, "Clear!"
    End If
End Sub

