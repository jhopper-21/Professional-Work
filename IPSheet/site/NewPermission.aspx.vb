Imports System.Data
Imports System.Data.OleDb
Imports System.Net.Mail
Partial Class site_NewWorkstation
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim CUAcon As New OleDbConnection("Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.MapPath("~/App_Data/CUA.mdb"))
        Dim Replacementcon As New OleDbConnection("Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.MapPath("~/App_Data/Replacement.mdb"))
        Dim CUAInsert As String = "INSERT INTO PermissionGroup(PermissionNumber,PermissionTitle,PermissionDescription) VALUES(@PNo,@PNa,@PDe)"

        Dim CUACommand As New OleDbCommand
        Dim ReplacementCommand As New OleDbCommand
        CUACommand = New OleDbCommand(CUAInsert, CUAcon)


        'Insert into "Workstations" DB.
        Try
            CUAcon.Open()
            CUACommand.Parameters.Add("@PNo", OleDbType.Char, 255).Value = txtNumber.Text
            CUACommand.Parameters.Add("@PNa", OleDbType.Char, 255).Value = txtName.Text
            CUACommand.Parameters.Add("@PDe", OleDbType.Char, 255).Value = txtDescription.Text
            CUACommand.ExecuteNonQuery()
            'Add an e-mail to IT support for workstaion addition notifications?
            CUAcon.Close()
        Catch ex As Exception
            Response.Write(ex.ToString)
            CUAcon.Close()
        End Try

        Response.Redirect("Home.aspx")





    End Sub


End Class
