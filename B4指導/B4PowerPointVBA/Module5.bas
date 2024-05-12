Attribute VB_Name = "Module5"

Sub Font_Size()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundNonExFontSize As Boolean

    ' �X���C�h���Ƃɏ���
    For Each slide In ActivePresentation.Slides
        ' �X���C�h���̂��ׂẴV�F�C�v�ɑ΂��ď���
        For Each shape In slide.Shapes
            ' �e�L�X�g�{�b�N�X�̏ꍇ�̂ݏ���
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' Title�̕����T�C�Y��36�ȏ�40�ȉ��łȂ��ꍇ�ɏ���
                If (shape.TextFrame.textRange.Font.Size < 18 Or shape.TextFrame.textRange.Font.Size > 40) And (shape.TextFrame.textRange.Font.Size < 36 Or shape.TextFrame.textRange.Font.Size > 32) Then
                    ' �R�����g�̃e�L�X�g��ݒ�
                    commentText = "�񐄏��̕����T�C�Y���g�p����Ă��܂��"
                    ' �R�����g��ǉ�
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundNonExFontSize = True
                End If
            End If
        Next shape
    Next slide

    ' �񐄏��̃t�H���g�T�C�Y��������Ȃ������ꍇ�̏���
    If Not foundNonExFontSize Then
        MsgBox "�񐄏��̃t�H���g�T�C�Y�͎g�p����Ă��܂���B", vbInformation, "Clear!"
    End If
End Sub

