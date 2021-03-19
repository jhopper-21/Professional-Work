Imports System.Data
Imports System.Data.OleDb
Imports System.Net.Mail
Partial Class site_NewWorkstation
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim CUAcon As New OleDbConnection("Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.MapPath("~/App_Data/CUA.mdb"))
        Dim Replacementcon As New OleDbConnection("Provider=Microsoft.JET.OLEDB.4.0;Data Source=" & Server.MapPath("~/App_Data/Replacement.mdb"))
        Dim CUAInsert As String = "INSERT INTO Workstations(InventoryTag,WorkstationName,IPAddress) VALUES(@Inv,@WkName,@IP)"
        Dim ReplacementInsert As String = "INSERT INTO Workstation(InventoryTag,WorkstationName,IPAddress,DeviceType,DateDeployed,BranchDeployed) VALUES(@Inv,@WkName,@IP,@WkModel,@DateDep,@Branch)"

        Dim CUACommand As New OleDbCommand
        Dim ReplacementCommand As New OleDbCommand
        CUACommand = New OleDbCommand(CUAInsert, CUAcon)
        ReplacementCommand = New OleDbCommand(ReplacementInsert, Replacementcon)


        'Insert into front-end DB.
        Try
            CUAcon.Open()
            CUACommand.Parameters.Add("@Inv", OleDbType.Char, 255).Value = txtInventory.Text
            CUACommand.Parameters.Add("@WkName", OleDbType.Char, 255).Value = txtWorkstationName.Text
            CUACommand.Parameters.Add("@IP", OleDbType.Char, 255).Value = txtIP.Text
            CUACommand.ExecuteNonQuery()
            'Add an e-mail to IT support for workstaion addition notifications?
            CUAcon.Close()
        Catch ex As Exception
            Response.Write(ex.ToString)
            CUAcon.Close()
        End Try

        'Insert into replacements DB
        Try

            Replacementcon.Open()
            ReplacementCommand.Parameters.Add("@Inv", OleDbType.Char, 255).Value = txtInventory.Text
            ReplacementCommand.Parameters.Add("@WkName", OleDbType.Char, 255).Value = txtWorkstationName.Text
            ReplacementCommand.Parameters.Add("@IP", OleDbType.Char, 255).Value = txtIP.Text
            ReplacementCommand.Parameters.Add("@WkModel", OleDbType.Char, 255).Value = ddlModel.SelectedValue
            ReplacementCommand.Parameters.Add("@DateDep", OleDbType.Char, 255).Value = Calendar1.SelectedDate
            ReplacementCommand.Parameters.Add("@Branch", OleDbType.Char, 255).Value = DropDownList1.SelectedValue
            ReplacementCommand.ExecuteNonQuery()

            Response.Redirect("Home.aspx?")
            'Add an e-mail to IT support for workstaion addition notifications?
            Replacementcon.Close()
        Catch ex As Exception
            Response.Write(ex.ToString)
            Replacementcon.Close()
        End Try




    End Sub
End Class
