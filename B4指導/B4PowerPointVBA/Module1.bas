Attribute VB_Name = "Module1"
Sub Emphasis_Detect()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundMultipleEffects As Boolean
    Dim paragraph As textRange
    
    ' �X���C�h���Ƃɏ���
    For Each slide In ActivePresentation.Slides
        ' �X���C�h���̂��ׂẴV�F�C�v�ɑ΂��ď���
        For Each shape In slide.Shapes
            ' �e�L�X�g�{�b�N�X�̏ꍇ�̂ݏ���
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' �e�L�X�g�{�b�N�X���̊e�i���ɑ΂��ď���
                For Each paragraph In textRange.Words
                    ' �������A�����������ɓK�p����Ă��邩�ǂ��������o���ăR�����g��ǉ�
                    If paragraph.Font.Underline <> False And paragraph.Font.Bold <> False Then
                        ' �R�����g�̃e�L�X�g��ݒ�
                        commentText = "�e�L�X�g�{�b�N�X���̈ꕔ�ɑ������A�����������ɓK�p����Ă��܂��B"
                        ' �R�����g��ǉ�
                        slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                        foundMultipleEffects = True
                        ' ��x�������烋�[�v�𔲂���
                        Exit For
                    End If
                Next paragraph
            End If
        Next shape
    Next slide
    
    ' �u���y���A�������A�����̑g�ݍ��킹��������Ȃ������ꍇ�̏���
    If Not foundMultipleEffects Then
        MsgBox "�e�L�X�g�{�b�N�X���̈ꕔ�ɋ����̑g�ݍ��킹�͌��o����܂���ł����B", vbInformation, "Clear!"
    End If
End Sub

