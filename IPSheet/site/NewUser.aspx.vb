Imports System.Net.Mail
Imports System.Data
Imports System.Data.OleDb
Partial Class EmployeeOB
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim strFirstName As String = txtFirstName.Text
        Dim strLastName As String = txtLastName.Text
        Dim strLastInitial As String = strLastName(0)
        Dim strAltEmail As String = strFirstName & strLastInitial
        Dim strOBEmail As String = "Hello," & "<br>" & "Here is the information for " + strFirstName + " " + strLastName + "(User#" + txtUserID.Text + "; x" + txtExtension.Text + ")" & "<br>" & "<br>" & "Outlook (Use this e-mail to sign into Outlook, ADP, and StandOut):" & "<br>" & "Username: " + txtUsername.Text + "@CUOFAMERICA.COM" & "<br>" & "Outlook password: " + txtPassword.Text & "<br>" & "<br>" & "Passwords for ADP and StandOut will be provided by the Human Resources department." & "<br>" & "<br>" & "Alternate e-mail (Use this for e-mail signatures and business cards):" & "<br>" & "E-mail: " & strAltEmail & "@CUOFAMERICA.COM" & "<br>" & "<br>" & "Windows:" & "<br>" & "Username: " + txtUsername.Text & "<br>" & "Password: " + txtPassword.Text & "<br>" & "<br>" & "Episys:" & "<br>" & "Username: " + txtUsername.Text & "<br>" & "Password: " + txtPassword.Text & "<br>" & "<br>" & "Disclaimer: This is an automated e-mail. Please reach out to jhopper@cuofamerica.com with any setup questions." & "<br>" & "<br>" & "Thank you," & "<br>" & "- Credit Union of America IT Department"

        Label2.Visible = True
        Label1.Visible = True
        btnSend.Visible = True
        Label1.Text = strOBEmail
        Label2.Text = "Please verify the information for " & strFirstName & " " & strLastName & "."
    End Sub
    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        Dim con As New OleDbConnection("Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/CUA.mdb"))
        Dim insert As String = "INSERT INTO Employee(EmployeeID,EmployeeFirstName,EmployeeLastName,EmployeeLogin,EmployeePermission,EmployeeExtension,BranchID) VALUES(@EID,@FirstName,@LastName,@Username,@Permissions,@Extension,@Branch)"

        Dim Command As New OleDbCommand
        Command = New OleDbCommand(insert, con)

        Try
            con.Open()
            Command.Parameters.Add("@EID", OleDbType.Char, 255).Value = txtUserID.Text
            Command.Parameters.Add("@FirstName", OleDbType.Char, 255).Value = txtFirstName.Text
            Command.Parameters.Add("@LastName", OleDbType.Char, 255).Value = txtLastName.Text
            Command.Parameters.Add("@Username", OleDbType.Char, 255).Value = txtUsername.Text
            Command.Parameters.Add("@Permissions", OleDbType.Char, 255).Value = ddlPermission.SelectedValue.ToString
            Command.Parameters.Add("@Extension", OleDbType.Char, 255).Value = txtExtension.Text
            Command.Parameters.Add("@Branch", OleDbType.Char, 255).Value = ddlLocation.SelectedValue.ToString
            Command.ExecuteNonQuery()
            Response.Write("Success")
            con.Close()
        Catch ex As Exception
            Response.Write(ex.ToString)
            con.Close()
        End Try

        Dim strFirstName As String = txtFirstName.Text
        Dim strLastName As String = txtLastName.Text
        Dim strLastInitial As String = strLastName(0)
        Dim strAltEmail As String = strFirstName & strLastInitial
        Dim EmailMessage As New MailMessage()
        Dim EmailMessage1 As New MailMessage()
        Dim strOB As String = "jhopper@cuofamerica.com"


        Dim strOBEmail As String = "Hello," & vbCrLf & "Here is the information for " + strFirstName + " " + strLastName + "(User#" + txtUserID.Text + "; x" + txtExtension.Text + ")" & vbCrLf & vbCrLf & "Outlook (Use this e-mail to sign into Outlook, ADP, and StandOut):" & vbCrLf & "Username: " + txtUsername.Text + "@CUOFAMERICA.COM" & vbCrLf & "Outlook password: " + txtPassword.Text & vbCrLf & vbCrLf & "Passwords for ADP and StandOut will be provided by the Human Resources department." & vbCrLf & vbCrLf & "Alternate e-mail (Use this for e-mail signatures and business cards):" & vbCrLf & "E-mail: " & strAltEmail & "@CUOFAMERICA.COM" & vbCrLf & vbCrLf & "Windows:" & vbCrLf & "Username: " + txtUsername.Text & vbCrLf & "Password: " + txtPassword.Text & vbCrLf & vbCrLf & "Episys:" & vbCrLf & "Username: " + txtUsername.Text & vbCrLf & "Password: " + txtPassword.Text & vbCrLf & vbCrLf & "Disclaimer: This is an automated e-mail. Please reach out to jhopper@cuofamerica.com with any setup questions." & vbCrLf & vbCrLf & "Thank you," & vbCrLf & "- Credit Union of America IT Department"




        'Onboard/ Offboard E-mail
        Try
            EmailMessage.From = New MailAddress("CUAmFreshservice@cuofamerica.org")
            EmailMessage.To.Add(strOB)
            EmailMessage.Subject = "User Setup: " + strFirstName + " " + strLastName
            EmailMessage.Body = strOBEmail

            Dim SMTP As New SmtpClient("outlook.office365.com")
            SMTP.Port = 587S
            SMTP.EnableSsl = True
            SMTP.Credentials = New System.Net.NetworkCredential("CUAmFreshservice@cuofamerica.org", "CUA1sFr3sh")
            SMTP.Send(EmailMessage)
        Catch ex As Exception
            Response.Write(ex.ToString)
        End Try


        'ARCU E-mail
        If ddlPermission.SelectedItem.ToString = "FSR" Or ddlPermission.SelectedItem.ToString = "USR" Or ddlPermission.SelectedItem.ToString = "Branch Manager" Or ddlPermission.SelectedItem.ToString = "Assistant Branch Manager" Then
            Dim strARCU As String = "Hello," & vbCrLf & "Please create " + strFirstName + " " + strLastName + " (User ID: " + txtUserID.Text + "), " + ddlPermission.SelectedItem.ToString + " at " & ddlLocation.SelectedItem.ToString & " in ARCU Incentive Reporting." & vbCrLf & vbCrLf & "Please contact jhopper@cuofamerica.com with any questions." & vbCrLf & vbCrLf & "Thank you, " & vbCrLf & "Credit Union of America IT Department"
            Dim strDBA As String = "DevHelpdesk@cuofamerica.org"
            Try
                EmailMessage.From = New MailAddress("CUAmFreshservice@cuofamerica.org")
                EmailMessage.To.Clear()
                EmailMessage.To.Add(strDBA)
                EmailMessage.Subject = "Create " + strFirstName + " " + strLastName + " in ARCU Incentive Reporting"
                EmailMessage.Body = strARCU

                Dim SMTP As New SmtpClient("outlook.office365.com")
                SMTP.Port = 587S
                SMTP.EnableSsl = True
                SMTP.Credentials = New System.Net.NetworkCredential("CUAmFreshservice@cuofamerica.org", "CUA1sFr3sh")
                SMTP.Send(EmailMessage)
            Catch ex As Exception
                Response.Write(ex.ToString)
            End Try
        End If

        'Eltropy E-mail
        If ddlPermission.SelectedItem.ToString = "FSR" Or ddlPermission.SelectedItem.ToString = "USR" Or ddlPermission.SelectedItem.ToString = "Branch Manager" Or ddlPermission.SelectedItem.ToString = "Assistant Branch Manager" Then
            Dim strEltropy As String = "Hello," & vbCrLf & "Please create " + strFirstName + " " + strLastName + " (User ID: " + txtUserID.Text + "), " + ddlPermission.SelectedItem.ToString + " at " & ddlLocation.SelectedItem.ToString & " in Eltropy." & vbCrLf & "The direct line for the new employee is: " & txtDirectLine.Text & "." & vbCrLf & vbCrLf & "Please contact jhopper@cuofamerica.com with any questions." & vbCrLf & vbCrLf & "Thank you, " & vbCrLf & "Credit Union of America IT Department"
            Dim strEltropyAdmin As String = "jhopper@cuofamerica.com"
            Try
                EmailMessage.From = New MailAddress("CUAmFreshservice@cuofamerica.org")
                EmailMessage.To.Clear()
                EmailMessage.To.Add(strEltropyAdmin)
                EmailMessage.Subject = "Create " + strFirstName + " " + strLastName + " in Eltropy"
                EmailMessage.Body = strEltropy

                Dim SMTP As New SmtpClient("outlook.office365.com")
                SMTP.Port = 587S
                SMTP.EnableSsl = True
                SMTP.Credentials = New System.Net.NetworkCredential("CUAmFreshservice@cuofamerica.org", "CUA1sFr3sh")
                SMTP.Send(EmailMessage)
            Catch ex As Exception
                Response.Write(ex.ToString)
            End Try
        End If

        Session.Abandon()
        Response.Redirect("Home.aspx?")
    End Sub

End Class
