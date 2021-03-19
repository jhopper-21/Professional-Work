Imports System.Data
Imports System.Data.OleDb
Partial Class site_UserSearch
    Inherits System.Web.UI.Page

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged, btnNameSearch.Click
        GridView2.Visible = False
        GridView3.Visible = True

    End Sub

    Private Sub TextBox2_TextChanged(sender As Object, e As EventArgs) Handles TextBox2.TextChanged, btnIDSearch.Click
        GridView2.Visible = True
        GridView3.Visible = False
    End Sub


    Protected Sub btnAddUser_Click(sender As Object, e As EventArgs) Handles btnAddUser.Click
        Response.Redirect("NewUser.aspx?")
    End Sub

    Protected Sub btnAddPermission_Click(sender As Object, e As EventArgs) Handles btnAddPermission.Click
        Response.Redirect("NewPermission.aspx")
    End Sub
End Class
