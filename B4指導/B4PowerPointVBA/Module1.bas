Attribute VB_Name = "Module1"
Sub Emphasis_Detect()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundMultipleEffects As Boolean
    Dim paragraph As textRange
    
    ' スライドごとに処理
    For Each slide In ActivePresentation.Slides
        ' スライド内のすべてのシェイプに対して処理
        For Each shape In slide.Shapes
            ' テキストボックスの場合のみ処理
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' テキストボックス内の各段落に対して処理
                For Each paragraph In textRange.Words
                    ' 太文字、下線が同時に適用されているかどうかを検出してコメントを追加
                    If paragraph.Font.Underline <> False And paragraph.Font.Bold <> False Then
                        ' コメントのテキストを設定
                        commentText = "テキストボックス内の一部に太文字、下線が同時に適用されています。"
                        ' コメントを追加
                        slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                        foundMultipleEffects = True
                        ' 一度見つけたらループを抜ける
                        Exit For
                    End If
                Next paragraph
            End If
        Next shape
    Next slide
    
    ' 蛍光ペン、太文字、下線の組み合わせが見つからなかった場合の処理
    If Not foundMultipleEffects Then
        MsgBox "テキストボックス内の一部に強調の組み合わせは検出されませんでした。", vbInformation, "Clear!"
    End If
End Sub

