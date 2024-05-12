Attribute VB_Name = "Module5"

Sub Font_Size()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundNonExFontSize As Boolean

    ' スライドごとに処理
    For Each slide In ActivePresentation.Slides
        ' スライド内のすべてのシェイプに対して処理
        For Each shape In slide.Shapes
            ' テキストボックスの場合のみ処理
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' Titleの文字サイズが36以上40以下でない場合に処理
                If (shape.TextFrame.textRange.Font.Size < 18 Or shape.TextFrame.textRange.Font.Size > 40) And (shape.TextFrame.textRange.Font.Size < 36 Or shape.TextFrame.textRange.Font.Size > 32) Then
                    ' コメントのテキストを設定
                    commentText = "非推奨の文字サイズが使用されています｡"
                    ' コメントを追加
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundNonExFontSize = True
                End If
            End If
        Next shape
    Next slide

    ' 非推奨のフォントサイズが見つからなかった場合の処理
    If Not foundNonExFontSize Then
        MsgBox "非推奨のフォントサイズは使用されていません。", vbInformation, "Clear!"
    End If
End Sub

