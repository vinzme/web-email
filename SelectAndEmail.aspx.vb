#Region "Imports"

Imports System.Data.SqlClient
Imports System.Security.Principal
Imports System.Web.UI.Page
Imports System.IO
Imports System.Net.Mail

#End Region

Partial Class SelectAndEmail
    Inherits System.Web.UI.Page
    Dim pubEmailAddress As String
    Dim pubComputerName As String
    Dim pubNotConnected As Boolean = False
    Dim pubTag As String
    Dim pubUser As String
    Dim pubSubject As String
    Dim pubFirstName As String
    Dim pubHtml As String = ""
    Dim pubItSupport As String
    Dim pubItSupportEmail As String
    Dim pubHtmlForITSupport As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim sUser() As String = Split(User.Identity.Name, "\")
        Dim sDomain As String = sUser(0)
        Dim sUserId As String = sUser(1)

        pubUser = UCase(sUserId)

        Page.Title = Label2.Text

        If Not IsPostBack Then
            CheckCsvError()
            GridView1.DataBind()
            CheckedAllItems()
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        CheckedAllItems()

        'Sample E-mail sending - Contact Information Change
        'Always put the content of the e-mail

        'SendEmailUpdateContacts()
        'Label3.Text = "Contact Information Change"
        'pubHtmlForITSupport = "<TR Height = ""20px""><TD> </TD></TR>"
        'SendMailToITSupport()

    End Sub

    Private Sub CheckedAllItems()

        Dim dr As GridViewRow
        Dim gIndex As Integer = -1
        For Each dr In GridView1.Rows

            If gIndex = -1 Then
                gIndex = 0
            End If

            Dim RowCheckBox As CheckBox = CType(GridView1.Rows(gIndex).FindControl("CheckBox1"), CheckBox)


            pubComputerName = GridView1.Rows(gIndex).Cells(1).Text
            CheckIfNotConnected()

            If pubNotConnected = False Then
                RowCheckBox.Checked = True

            End If

            gIndex += 1

        Next

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        UnCheckAllItems()
    End Sub

    Private Sub CheckIfNotConnected()

        Dim ConnStr As String
        Dim sSql As String

        ConnStr = "Data Source=SESLSVRHO;User ID=scheme;Password=Er1c550n2;initial catalog=SES"
        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try

            sSql = "SELECT computer_name FROM and_csv_consolidated where desktop_laptop_notconnected = '1' " & _
                        "and computer_name = '" & pubComputerName & "'"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then
                pubNotConnected = True
            Else
                pubNotConnected = False
            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Private Sub UnCheckAllItems()

        Dim dr As GridViewRow
        Dim gIndex As Integer = -1
        For Each dr In GridView1.Rows

            If gIndex = -1 Then
                gIndex = 0
            End If

            Dim RowCheckBox As CheckBox = CType(GridView1.Rows(gIndex).FindControl("CheckBox1"), CheckBox)

            RowCheckBox.Checked = False

            gIndex += 1

        Next

    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click

        Dim dr As GridViewRow
        Dim gIndex As Integer = -1
        For Each dr In GridView1.Rows

            If gIndex = -1 Then
                gIndex = 0
            End If

            Dim RowCheckBox As CheckBox = CType(GridView1.Rows(gIndex).FindControl("CheckBox1"), CheckBox)

            If RowCheckBox.Checked = True Then
                pubEmailAddress = GridView1.Rows(gIndex).Cells(13).Text
                'pubEmailAddress = "it.support"

                'check for valid email address
                If InStr(1, Trim(pubEmailAddress), ".") > 0 Then

                    pubComputerName = GridView1.Rows(gIndex).Cells(1).Text
                    pubTag = GridView1.Rows(gIndex).Cells(4).Text
                    pubFirstName = UCase(Mid(pubEmailAddress, 1, 1)) & Mid(pubEmailAddress, 2, InStr(1, Trim(pubEmailAddress), ".") - 2)
                    If pubTag.Trim = "D" Then
                        pubSubject = "Desktop (" & pubComputerName.Trim & ") - " & Label3.Text.Trim
                        pubItSupport = "Desktop (" & pubComputerName.Trim & "); " & pubEmailAddress
                    Else
                        If pubTag.Trim = "L" Then
                            pubSubject = "Laptop (" & pubComputerName.Trim & ") - " & Label3.Text.Trim
                            pubItSupport = "Laptop (" & pubComputerName.Trim & "); " & pubEmailAddress
                        Else
                            pubSubject = GridView1.Rows(gIndex).Cells(4).Text.Trim & " (" & pubComputerName.Trim & ") - " & Label3.Text.Trim
                            pubItSupport = GridView1.Rows(gIndex).Cells(4).Text.Trim & " (" & pubComputerName.Trim & "); " & pubEmailAddress
                        End If
                    End If

                    pubHtml = pubHtml & "<TR Height = ""20px""><TD>" & pubItSupport.Trim & " </TD></TR>"

                    If Label3.Text.Trim = "Reboot Required" Then
                        Send_EmailPendingReboot()
                    Else
                        If Label3.Text.Trim = "Software updates ready for installation" Then
                            SendDownloadUpdates()
                        Else
                            If Label3.Text.Trim = "Update your antivirus definition" Then
                                EndPointProtection()
                            Else
                                SendEmailNoIE8()
                            End If
                        End If
                    End If
                End If
            End If

            gIndex += 1

        Next

        If Label3.Text.Trim = "Reboot Required" Then
            HtmlITSupportPendingReboot()
        Else
            If Label3.Text.Trim = "Update your antivirus definition" Then
                HtmlITSupportEndPoint()
            Else
                HtmlITSupportDownloadUpdates()
            End If
        End If

        If Label3.Text.Trim = "Install Internet Explorer 8 ASAP" Then
            SendEmailNoIE8ITSupport()
        Else
            SendMailToITSupport()
        End If

        UnCheckAllItems()

    End Sub

    Private Sub HtmlITSupportPendingReboot()

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>Software updates were recently installed on the above mentioned computerS. It is necessary to restart these computers as soon as possible to completely activate these updates. </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""10px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>Please follow this link on how to proceed: <a href='http://inside.saudi-ericsson.com/it/checking4update.htm'>http://inside.saudi-ericsson.com/it/checking4update.htm</a>   or contact IT Support for assistance. </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>Regards, </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>IT Support Team </TD></TR>"

    End Sub

    Private Sub HtmlITSupportDownloadUpdates()

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>Software updates were recently downloaded on the above mentioned computers.  It is highly recommended that these updates be installed immediately. </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""10px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>Please follow this link on how to proceed with installation: <a href='http://inside.saudi-ericsson.com/it/checking4update.htm'>http://inside.saudi-ericsson.com/it/checking4update.htm</a>   or contact IT Support for assistance. </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>Regards, </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>IT Support Team </TD></TR>"


    End Sub

    Private Sub HtmlITSupportEndPoint()

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>You may be getting a warning that your ''Antivirus and Antispyware definition are out of date'' from Symantec Endpoint Protection client software. </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""10px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>This was due to the recent upgrade of SES Antivirus/Antispyware system. To reconnect to the new server, please double click the following link to update your configuration file: </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"
        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"
        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>For DESKTOP, use this link: <a href='\\sesesvrho\Symantec Client 32\SylinkDrop\desktop.bat'>Antivirus and Antispyware Desktop Update </a>   </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"
        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"
        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"
        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>For LAPTOP, use this link: <a href='\\sesesvrho\Symantec Client 32\SylinkDrop\laptop.bat'>Antivirus and Antispyware Laptop Update</a>    </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"
        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD> </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>Regards, </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""20px""><TD>IT Support Team </TD></TR>"

        pubHtmlForITSupport = pubHtmlForITSupport & "<TR Height = ""50px""><TD> </TD></TR>"

    End Sub

    Private Sub Send_EmailPendingReboot()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"

        Dim sToEmail As String = pubEmailAddress.Trim & "@saudi-ericsson.com"
        'Dim sToEmail As String = "it.support@saudi-ericsson.com"
        'Dim sToEmail As String = "alvin.deleon@saudi-ericsson.com"
        'Dim sToEmail As String = "noli.jaraplasan@saudi-ericsson.com"

        Dim sSubject As String = pubSubject

        Dim HTML As String

        HTML = "<HTML>"

        HTML = HTML & "<HEAD>"

        HTML = HTML & "<TITLE>Send Mail with HTML</TITLE>"

        HTML = HTML & "</HEAD>"

        HTML = HTML & "<BODY  bgcolor=""white"">"

        HTML = HTML & "<FONT FACE= 'Verdana'>"

        HTML = HTML & "<TABLE >"

        HTML = HTML & "<TR Height = ""20px""><TD>Dear " & pubFirstName.Trim & "," & " </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Software updates were recently installed on the above mentioned computer. It is necessary to restart your computer as soon as possible to completely activate these updates. </TD></TR>"

        HTML = HTML & "<TR Height = ""10px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Please follow this link on how to proceed: <a href='http://inside.saudi-ericsson.com/it/checking4update.htm'>http://inside.saudi-ericsson.com/it/checking4update.htm</a>   or contact IT Support for assistance. </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Regards, </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>IT Support Team </TD></TR>"

        HTML = HTML & "<TR Height = ""50px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>P.S.  If you received this email in 'Junk E-mail' instead of 'Inbox', follow this <a href='http://inside.saudi-ericsson.com/it/Leg_Junk_Email.htm'>procedure</a>   to resolve it. </TD></TR>"

        HTML = HTML & "</A></TD> </TR> </TABLE> "

        HTML = HTML & "</BODY>"

        HTML = HTML & "</HTML>"


        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        'Dim mCcMail As New MailAddress("it.support@saudi-ericsson.com")
        'Dim mCcMail As New MailAddress("noli.jaraplasan@saudi-ericsson.com")

        'mail.Bcc.Add(mCcMail)

        mail.Subject = sSubject

        mail.Body = HTML

        mail.IsBodyHtml = True

        'mail.ReplyTo = New MailAddress("it.support@saudi-ericsson.com")


        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

    Private Sub GetTextFileContent()
        Dim fp As StreamReader

        Try
            fp = File.OpenText(Server.MapPath(".\") & "vpnie8.txt")
            TextBox1.Text = fp.ReadToEnd()
            fp.Close()

        Catch ex As Exception

        End Try

    End Sub

    Private Sub SendEmailNoIE8ITSupport()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"
        'Dim sFrmEmail As String = "alvin.deleon@saudi-ericsson.com"

        'Dim sToEmail As String = pubEmailAddress.Trim & "@saudi-ericsson.com"
        Dim sToEmail As String = "it.support@saudi-ericsson.com"
        'Dim sToEmail As String = "alvin.deleon@saudi-ericsson.com"
        'Dim sToEmail As String = "noli.jaraplasan@saudi-ericsson.com"
        'Dim sToEmail As String = "marvin.urbano@saudi-ericsson.com"


        Dim sSubject As String = Label3.Text.Trim

        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        'Dim mCcMail As New MailAddress("it.support@saudi-ericsson.com")
        'Dim mCcMail As New MailAddress("noli.jaraplasan@saudi-ericsson.com")

        'mail.Bcc.Add(mCcMail)
        Dim HTML As String

        HTML = "<HTML>"

        HTML = HTML & "<HEAD>"

        HTML = HTML & "<TITLE>Send Mail with HTML</TITLE>"

        HTML = HTML & "</HEAD>"

        HTML = HTML & "<BODY  bgcolor=""white"">"

        HTML = HTML & "<FONT FACE= 'Verdana'>"

        HTML = HTML & "<TABLE >"

        HTML = HTML & "<TR Height = ""20px""><TD>List of Computers: </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & pubHtml

        'HTML = HTML & pubHtmlForITSupport

        HTML = HTML & "</A></TD> </TR> </TABLE> "

        HTML = HTML & "</BODY>"

        HTML = HTML & "</HTML>"


        mail.Subject = sSubject

        mail.Body = HTML & "        " & TextBox1.Text.Trim

        mail.IsBodyHtml = True

        'mail.ReplyTo = New MailAddress("it.support@saudi-ericsson.com")

        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

    Private Sub EndPointProtection()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"

        Dim sToEmail As String = pubEmailAddress.Trim & "@saudi-ericsson.com"
        'Dim sToEmail As String = "it.support@saudi-ericsson.com"
        'Dim sToEmail As String = "alvin.deleon@saudi-ericsson.com"
        'Dim sToEmail As String = "noli.jaraplasan@saudi-ericsson.com"

        Dim sSubject As String = pubSubject

        Dim HTML As String

        HTML = "<HTML>"

        HTML = HTML & "<HEAD>"

        HTML = HTML & "<TITLE>Send Mail with HTML</TITLE>"

        HTML = HTML & "</HEAD>"

        HTML = HTML & "<BODY  bgcolor=""white"">"

        HTML = HTML & "<FONT FACE= 'Verdana'>"

        HTML = HTML & "<TABLE >"

        HTML = HTML & "<TR Height = ""20px""><TD>Dear " & pubFirstName.Trim & "," & " </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>You may be getting a warning that your ''Antivirus and Antispyware definition are out of date'' from Symantec Endpoint Protection client software. </TD></TR>"

        HTML = HTML & "<TR Height = ""10px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>This was due to the recent upgrade of SES Antivirus/Antispyware system. To reconnect to the new server, please double click the following link to update your configuration file: </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"
        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"
        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>For DESKTOP, use this link: <a href='\\sesesvrho\Symantec Client 32\SylinkDrop\desktop.bat'>Antivirus and Antispyware Desktop Update </a>   </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"
        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"
        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"
        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>For LAPTOP, use this link: <a href='\\sesesvrho\Symantec Client 32\SylinkDrop\laptop.bat'>Antivirus and Antispyware Laptop Update</a>    </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"
        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Regards, </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>IT Support Team </TD></TR>"

        HTML = HTML & "<TR Height = ""50px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>P.S.  If you received this email in 'Junk E-mail' instead of 'Inbox', follow this <a href='http://inside.saudi-ericsson.com/it/Leg_Junk_Email.htm'>procedure</a>   to resolve it. </TD></TR>"

        HTML = HTML & "</A></TD> </TR> </TABLE> "

        HTML = HTML & "</BODY>"

        HTML = HTML & "</HTML>"

        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        'Dim mCcMail As New MailAddress("it.support@saudi-ericsson.com")
        'Dim mCcMail As New MailAddress("noli.jaraplasan@saudi-ericsson.com")

        'mail.Bcc.Add(mCcMail)

        mail.Subject = sSubject

        mail.Body = HTML

        mail.IsBodyHtml = True

        'mail.ReplyTo = New MailAddress("it.support@saudi-ericsson.com")

        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

    Private Sub SendEmailNoIE8()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"
        'Dim sFrmEmail As String = "alvin.deleon@saudi-ericsson.com"

        Dim sToEmail As String = pubEmailAddress.Trim & "@saudi-ericsson.com"
        'Dim sToEmail As String = "it.support@saudi-ericsson.com"
        'Dim sToEmail As String = "alvin.deleon@saudi-ericsson.com"
        'Dim sToEmail As String = "noli.jaraplasan@saudi-ericsson.com"
        'Dim sToEmail As String = "marvin.urbano@saudi-ericsson.com"


        Dim sSubject As String = pubSubject

        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        'Dim mCcMail As New MailAddress("it.support@saudi-ericsson.com")
        'Dim mCcMail As New MailAddress("noli.jaraplasan@saudi-ericsson.com")

        'mail.Bcc.Add(mCcMail)

        mail.Subject = sSubject

        mail.Body = TextBox1.Text.Trim

        mail.IsBodyHtml = True

        'mail.ReplyTo = New MailAddress("it.support@saudi-ericsson.com")

        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

    Private Sub SendDownloadUpdates()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"

        Dim sToEmail As String = pubEmailAddress.Trim & "@saudi-ericsson.com"
        'Dim sToEmail As String = "it.support@saudi-ericsson.com"
        'Dim sToEmail As String = "alvin.deleon@saudi-ericsson.com"
        'Dim sToEmail As String = "noli.jaraplasan@saudi-ericsson.com"

        Dim sSubject As String = pubSubject

        Dim HTML As String

        HTML = "<HTML>"

        HTML = HTML & "<HEAD>"

        HTML = HTML & "<TITLE>Send Mail with HTML</TITLE>"

        HTML = HTML & "</HEAD>"

        HTML = HTML & "<BODY  bgcolor=""white"">"

        HTML = HTML & "<FONT FACE= 'Verdana'>"

        HTML = HTML & "<TABLE >"

        HTML = HTML & "<TR Height = ""20px""><TD>Dear " & pubFirstName.Trim & "," & " </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Software updates were recently downloaded on the above mentioned computer.  It is highly recommended that these updates be installed immediately. </TD></TR>"

        HTML = HTML & "<TR Height = ""10px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Please follow this link on how to proceed with installation: <a href='http://inside.saudi-ericsson.com/it/checking4update.htm'>http://inside.saudi-ericsson.com/it/checking4update.htm</a>   or contact IT Support for assistance. </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Regards, </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>IT Support Team </TD></TR>"

        HTML = HTML & "<TR Height = ""50px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>P.S.  If you received this email in 'Junk E-mail' instead of 'Inbox', follow this <a href='http://inside.saudi-ericsson.com/it/Leg_Junk_Email.htm'>procedure</a>   to resolve it. </TD></TR>"

        HTML = HTML & "</A></TD> </TR> </TABLE> "

        HTML = HTML & "</BODY>"

        HTML = HTML & "</HTML>"


        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        'Dim mCcMail As New MailAddress("it.support@saudi-ericsson.com")
        'Dim mCcMail As New MailAddress("noli.jaraplasan@saudi-ericsson.com")

        'mail.Bcc.Add(mCcMail)

        mail.Subject = sSubject

        mail.Body = HTML

        mail.IsBodyHtml = True

        'mail.ReplyTo = New MailAddress("it.support@saudi-ericsson.com")

        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

    Private Sub SendMailToITSupport()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"

        Dim sToEmail As String = "it.support@saudi-ericsson.com"
        'Dim sToEmail As String = "alvin.deleon@saudi-ericsson.com"

        Dim sSubject As String = Label3.Text.Trim

        Dim HTML As String

        HTML = "<HTML>"

        HTML = HTML & "<HEAD>"

        HTML = HTML & "<TITLE>Send Mail with HTML</TITLE>"

        HTML = HTML & "</HEAD>"

        HTML = HTML & "<BODY  bgcolor=""white"">"

        HTML = HTML & "<FONT FACE= 'Verdana'>"

        HTML = HTML & "<TABLE >"

        HTML = HTML & "<TR Height = ""20px""><TD>List of Computers: </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & pubHtml

        HTML = HTML & pubHtmlForITSupport

        HTML = HTML & "</A></TD> </TR> </TABLE> "

        HTML = HTML & "</BODY>"

        HTML = HTML & "</HTML>"


        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        mail.Subject = sSubject

        mail.Body = HTML

        mail.IsBodyHtml = True

        'mail.ReplyTo = New MailAddress("it.support@saudi-ericsson.com")

        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

    Private Sub CheckCsvError()

        Dim ConnStr As String
        Dim sSql As String

        ConnStr = "Data Source=SESLSVRHO;User ID=scheme;Password=Er1c550n2;initial catalog=SES"
        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try

            sSql = "Select selected_device, selected_error from and_csv_selected_error where userid = '" & pubUser.Trim & "'"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then
                While mReader.Read()
                    If Trim(mReader("selected_error")) = "" Then
                        Label2.Text = "Send Email : " & Trim(mReader("selected_device")) & "  - Symantec Endpoint Protection Update"
                    Else
                        Label2.Text = "Send Email : " & Trim(mReader("selected_device")) & "  -  " & Trim(mReader("selected_error"))
                    End If

                    Page.Title = Label2.Text

                    Select Case Trim(mReader("selected_error"))
                        Case "Downloaded Updates"
                            Label3.Text = "Software updates ready for installation"
                        Case "No IE8 Installed"
                            Label3.Text = "Install Internet Explorer 8 ASAP"
                            GetTextFileContent()
                        Case "Pending Reboot"
                            Label3.Text = "Reboot Required"
                        Case ""
                            Label3.Text = "Update your antivirus definition"
                    End Select

                    'If Trim(mReader("selected_error")) = "Downloaded Updates" Then
                    ' Label3.Text = "Software updates ready for installation"
                    'Else
                    'Label3.Text = "Reboot Required"
                    'End If

                    Select Case Trim(mReader("selected_device"))
                        Case "Any"
                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource1"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource2"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource3"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource22"
                            End Select
                        Case "Desktop"
                            Label1.Text = "D"

                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource4"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource8"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource12"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource23"
                                Case ""
                                    GridView1.DataSourceID = "ObjectDataSource29"
                            End Select


                        Case "Laptop"
                            Label1.Text = "L"
                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource4"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource8"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource12"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource23"
                                Case ""
                                    GridView1.DataSourceID = "ObjectDataSource29"
                            End Select

                        Case "Servers"

                        Case "Other Devices"
                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource5"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource9"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource13"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource24"
                            End Select

                        Case "Desktop, Laptop, Servers"

                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource19"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource20"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource21"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource25"
                            End Select

                        Case "Riyadh"
                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource6"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource10"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource14"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource26"
                            End Select


                        Case "Jeddah"
                            Label1.Text = "192.168.12"
                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource7"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource11"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource15"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource27"
                            End Select

                        Case "Dammam"
                            Label1.Text = "192.168.13"
                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource7"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource11"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource15"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource27"
                            End Select
                        Case "Connected"
                            Select Case Trim(mReader("selected_error"))
                                Case "Updates with No Status"
                                    GridView1.DataSourceID = "ObjectDataSource17"
                                Case "Downloaded Updates"
                                    GridView1.DataSourceID = "ObjectDataSource16"
                                Case "Pending Reboot"
                                    GridView1.DataSourceID = "ObjectDataSource18"
                                Case "No IE8 Installed"
                                    GridView1.DataSourceID = "ObjectDataSource28"
                            End Select
                    End Select

                End While
            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Private Sub SendEmailUpdateContacts()

        Dim ConnStr As String
        Dim sSql As String

        ConnStr = "Data Source=SESLSVRHO;User ID=scheme;Password=Er1c550n2;initial catalog=SES"
        Dim MySqlConn As New SqlConnection(ConnStr)
        MySqlConn.Open()
        Try

            'sSql = "SELECT emailaddress FROM zcontact"
            sSql = "Select computer_name, login_name as emailaddress from zcomputerlist"
            'sSql = "Select computer_name, login_name as emailaddress from zcontact"

            Dim MySqlCmd As New SqlCommand(sSql, MySqlConn)
            Dim mReader As SqlDataReader

            mReader = MySqlCmd.ExecuteReader()
            If mReader.HasRows Then
                While mReader.Read()
                    pubComputerName = Trim(mReader("computer_name"))

                    pubEmailAddress = Trim(mReader("emailaddress"))

                    pubFirstName = UCase(Mid(pubEmailAddress, 1, 1)) & Mid(pubEmailAddress, 2, InStr(1, Trim(pubEmailAddress), ".") - 2)

                    pubHtml = pubHtml & "<TR Height = ""20px""><TD>" & pubEmailAddress.Trim & " </TD></TR>"

                    'SendEmailToContacts()
                    SendEmailUpdateServicePack()


                End While
            End If

        Catch ex As Exception

        Finally
            MySqlConn.Close()
        End Try

    End Sub

    Private Sub SendEmailToContacts()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"

        Dim sToEmail As String = pubEmailAddress.Trim

        Dim sSubject As String = "Contact Information Change"

        Dim HTML As String

        HTML = "<HTML>"

        HTML = HTML & "<HEAD>"

        HTML = HTML & "<TITLE>Send Mail with HTML</TITLE>"

        HTML = HTML & "</HEAD>"

        HTML = HTML & "<BODY  bgcolor=""white"">"

        HTML = HTML & "<FONT FACE= 'Verdana'>"

        HTML = HTML & "<TABLE >"

        HTML = HTML & "<TR Height = ""20px""><TD>Your contact information in SES Global Directory has recently been updated. </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>For any update or queries of its accuracy, please contact IT Support Team.</TD></TR>"

        HTML = HTML & "<TR Height = ""10px""><TD> </TD></TR>"

        HTML = HTML & " </TABLE> "

        HTML = HTML & "</BODY>"

        HTML = HTML & "</HTML>"


        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        mail.Subject = sSubject

        mail.Body = HTML

        mail.IsBodyHtml = True


        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

    Private Sub SendEmailUpdateServicePack()

        Dim sFrmEmail As String = "it.support@saudi-ericsson.com"

        Dim sToEmail As String = pubEmailAddress.Trim & "@saudi-ericsson.com"

        Dim sSubject As String = "The 2007 Microsoft Office Suite SP3 for " & pubComputerName.Trim & " (Laptop)"

        Dim HTML As String

        HTML = "<HTML>"

        HTML = HTML & "<HEAD>"

        HTML = HTML & "<TITLE>Send Mail with HTML</TITLE>"

        HTML = HTML & "</HEAD>"

        HTML = HTML & "<BODY  bgcolor=""white"">"

        HTML = HTML & "<FONT FACE= 'Verdana'>"

        HTML = HTML & "<TABLE >"

        HTML = HTML & "<TR Height = ""20px""><TD>Dear " & pubFirstName.Trim & "," & " </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Microsoft recently release the latest Service Pack to fix bugs and security vulnerabilities on Office 2007. </TD></TR>"

        HTML = HTML & "<TR Height = ""10px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>This software is not covered by our automatic update, hence, you are requested to manually install the program from this location: <a href='http://vpn.saudi-ericsson.com.sa/su/The 2007 MS Office Suite SP3/office2007sp3-kb2526086-fullfile-en-us.exe'>http://vpn.saudi-ericsson.com.sa/su/The 2007 MS Office Suite SP3/office2007sp3-kb2526086-fullfile-en-us.exe</a> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Warning:  Install this update on the subject mentioned computer only !!!</TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"
        HTML = HTML & "<TR Height = ""20px""><TD> </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>Regards, </TD></TR>"

        HTML = HTML & "<TR Height = ""20px""><TD>IT Support Team </TD></TR>"

        HTML = HTML & "</A></TD> </TR> </TABLE> "

        HTML = HTML & "</BODY>"

        HTML = HTML & "</HTML>"

        Dim fEmail As New MailAddress(sFrmEmail, "IT Support Team")

        Dim tEmail As New MailAddress(sToEmail)

        Dim mail As New MailMessage(fEmail, tEmail)

        mail.Priority = MailPriority.High

        mail.Subject = sSubject

        mail.Body = HTML

        mail.IsBodyHtml = True


        Dim smtp As New SmtpClient

        smtp.Host = "SMTP.SAUDI-ERICSSON.COM"

        smtp.Send(mail)

    End Sub

End Class
