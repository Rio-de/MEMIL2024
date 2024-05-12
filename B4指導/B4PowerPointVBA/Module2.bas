Attribute VB_Name = "Module2"
Sub BulletPoint()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundStrangeBullet As Boolean
    
    ' スライドごとに処理
    For Each slide In ActivePresentation.Slides
        ' スライド内のすべてのシェイプに対して処理
        For Each shape In slide.Shapes
            ' テキストボックスの場合のみ処理
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' 不適切な箇条書きを検出してコメントを追加
                If textRange.Paragraphs.Count = 1 And textRange.Paragraphs(1).ParagraphFormat.Bullet.Visible Then
                    ' コメントのテキストを設定
                    commentText = "箇条書きが不適切に使用されています。"
                    ' コメントを追加
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundStrangeBullet = True
                End If
            End If
        Next shape
    Next slide
    
    ' 不適切な箇条書きが見つからなかった場合の処理
    If Not foundStrangeBullet Then
        MsgBox "箇条書きが適切に使用されています。", vbInformation, "Clear!"
    End If
End Sub


