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
    
    ' ���o�֐����`
    Set regex = CreateObject("VBScript.RegExp")
    regex.Global = True
    regex.Pattern = "[^\s]\("
    
    ' �X���C�h���Ƃɏ���
    For Each slide In ActivePresentation.Slides
        ' �X���C�h���̂��ׂẴV�F�C�v�ɑ΂��ď���
        For Each shape In slide.Shapes
            ' �e�L�X�g�{�b�N�X�̏ꍇ�̂ݏ���
            If shape.HasTextFrame Then
                Set textRange = shape.TextFrame.textRange
                ' ���p���ʂ̑O�ɔ��p�X�y�[�X���܂܂�Ă��Ȃ��ꍇ�����o���ăR�����g��ǉ�
                If regex.Test(textRange.Text) Then
                    ' �R�����g�̃e�L�X�g��ݒ�
                    commentText = "���p���ʂ̑O�ɔ��p�X�y�[�X���܂܂�Ă��܂���B"
                    ' �R�����g��ǉ�
                    slide.Comments.Add shape.Left, shape.Top, "Author", "Initials", commentText
                    foundNonBracket = True
                End If
            End If
        Next shape
    Next slide
    
    ' ���p���ʂ̑O�ɔ��p�X�y�[�X���܂܂�Ă����ꍇ�̏���
    If Not foundNonBracket Then
        MsgBox "���p���ʂ��K�؂Ɏg�p����Ă��܂�", vbInformation, "Clear!"
    End If
End Sub


