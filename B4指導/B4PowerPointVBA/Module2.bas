Attribute VB_Name = "Module2"
Sub BulletPoint()
    Dim slide As slide
    Dim shape As shape
    Dim textRange As textRange
    Dim commentText As String
    Dim foundStrangeBullet As Boolean
    
    ' �X���C�h���Ƃɏ���
    For Each slide In ActivePresentation.Slides
        ' �X���C�h���̂��ׂẴV�F�C�v�ɑ΂��ď���
        For Each shape In slide.Shapes
            ' �e�L�X�g�{�b�N�X�̏ꍇ�̂ݏ���
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' �s�K�؂ȉӏ����������o���ăR�����g��ǉ�
                If textRange.Paragraphs.Count = 1 And textRange.Paragraphs(1).ParagraphFormat.Bullet.Visible Then
                    ' �R�����g�̃e�L�X�g��ݒ�
                    commentText = "�ӏ��������s�K�؂Ɏg�p����Ă��܂��B"
                    ' �R�����g��ǉ�
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundStrangeBullet = True
                End If
            End If
        Next shape
    Next slide
    
    ' �s�K�؂ȉӏ�������������Ȃ������ꍇ�̏���
    If Not foundStrangeBullet Then
        MsgBox "�ӏ��������K�؂Ɏg�p����Ă��܂��B", vbInformation, "Clear!"
    End If
End Sub


