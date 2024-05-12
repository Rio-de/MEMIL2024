Attribute VB_Name = "Module6"
Sub Font_Calibri()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundNonCalibriFont As Boolean
    
    ' �X���C�h���Ƃɏ���
    For Each slide In ActivePresentation.Slides
        ' �X���C�h���̂��ׂẴV�F�C�v�ɑ΂��ď���
        For Each shape In slide.Shapes
            ' �e�L�X�g�{�b�N�X�̏ꍇ�̂ݏ���
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' Calibri�ȊO�̃t�H���g�����o���ăR�����g��ǉ�
                If Not textRange.Font.Name = "Calibri" Then
                    ' �R�����g�̃e�L�X�g��ݒ�
                    commentText = "Calibri�ȊO�̃t�H���g���g�p����Ă��܂��B"
                    ' �R�����g��ǉ�
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundNonCalibriFont = True
                End If
            End If
        Next shape
    Next slide
    
    ' Calibri�ȊO�̃t�H���g��������Ȃ������ꍇ�̏���
    If Not foundNonCalibriFont Then
        MsgBox "Calibri�ȊO�̃t�H���g�͎g�p����Ă��܂���B", vbInformation, "Clear!"
    End If
End Sub

