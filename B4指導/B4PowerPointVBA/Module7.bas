Attribute VB_Name = "Module7"
Sub Space_and_Bracket()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundNonBracket As Boolean
    Dim regex As Object
    Dim matches As Object
    Dim match As Object
    
    ' 検出関数を定義
    Set regex = CreateObject("VBScript.RegExp")
    regex.Global = True
    regex.Pattern = "[^\s]\("
    
    ' スライドごとに処理
    For Each slide In ActivePresentation.Slides
        ' スライド内のすべてのシェイプに対して処理
        For Each shape In slide.Shapes
            ' テキストボックスの場合のみ処理
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' 半角括弧の前に半角スペースが含まれていない場合を検出してコメントを追加
                If regex.Test(textRange.Text) Then
                    ' コメントのテキストを設定
                    commentText = "半角括弧の前に半角スペースが含まれていません。"
                    ' コメントを追加
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundNonBracket = True
                End If
            End If
        Next shape
    Next slide
    
    ' 半角括弧の前に半角スペースが含まれていた場合の処理
    If Not foundNonBracket Then
        MsgBox "半角括弧が適切に使用されています", vbInformation, "Clear!"
    End If
End Sub


