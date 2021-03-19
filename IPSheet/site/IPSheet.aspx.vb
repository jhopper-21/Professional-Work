Imports System.Data
Imports System.Data.OleDb
Partial Class site_IPSheetNew
    Inherits System.Web.UI.Page
    Private Sub ClearAll()
        GrdDelano.Visible = False
        GrdGreatBend.Visible = False
        GrdNorthRock.Visible = False
        GrdRidgeRoad.Visible = False
        GrdSouthBroadway.Visible = False
        grdEastHarry.Visible = False
        grdDerby.Visible = False
        GrdWoodlawn.Visible = False
        GrdWest21.Visible = False
        GrdMaize.Visible = False
        grdGoddard.Visible = False
        grdSalina.Visible = False
        grdHutchinson.Visible = False
        GrdPratt.Visible = False
        GrdEast21.Visible = False
        GrdCorporate.Visible = False
        GrdIP.Visible = False
        GrdName.Visible = False
        GrdPrinters.Visible = False

    End Sub
    Private Sub IP(sender As Object, e As EventArgs) Handles txtIP.TextChanged, btnSearchIP.Click
        ClearAll()
        GrdIP.Visible = True
    End Sub

    Protected Sub NewWorkstation(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("NewWorkstation.aspx?")
    End Sub


    Protected Sub Name(sender As Object, e As EventArgs) Handles btnSeachName.Click, txtName.TextChanged
        ClearAll()
        GrdName.Visible = True
    End Sub

    Protected Sub Location(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        ClearAll()
        Select Case True
            Case DropDownList1.SelectedItem.ToString = "Delano"
                lblIPRange.Text = "IP Ranges: 172.16.8.X ; 10.1.40.X"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.0"
                lblDefaultGateway.Text = "Default Gateways: 172.16.8.254 ; 10.1.40.254"
                GrdDelano.Visible = True
            Case DropDownList1.SelectedItem.ToString = "Great Bend"
                GrdGreatBend.Visible = True
                lblIPRange.Text = "IP Ranges: 172.16.34.65 - 172.16.34.94 ; 172.16.35.65 - 172.16.35.94"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224"
                lblDefaultGateway.Text = "Default Gateways: 172.16.34.65 ; 10.1.35.65"
            Case DropDownList1.SelectedItem.ToString = "North Rock"
                GrdNorthRock.Visible = True
                lblIPRange.Text = "IP Range: 172.16.34.193 - 172.16.34.222"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224"
                lblDefaultGateway.Text = "Default Gateway: 172.16.34.193"
            Case DropDownList1.SelectedItem.ToString = "Ridge Road"
                GrdRidgeRoad.Visible = True
                lblIPRange.Text = "IP Range: 172.16.34.129 - 172.16.34.158"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224"
                lblDefaultGateway.Text = "Default Gateway: 172.16.34.129"
            Case DropDownList1.SelectedItem.ToString = "South Broadway"
                GrdSouthBroadway.Visible = True
                lblIPRange.Text = "IP Range: 172.16.34.33 - 172.16.34.62"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224"
                lblDefaultGateway.Text = "Default Gateway: 172.16.34.33"
            Case DropDownList1.SelectedItem.ToString = "East Harry"
                grdEastHarry.Visible = True
                lblIPRange.Text = "IP Range: 172.16.34.97 - 172.16.34.126"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224"
                lblDefaultGateway.Text = "Default Gateway: 172.16.34.97"
            Case DropDownList1.SelectedItem.ToString = "Derby"
                grdDerby.Visible = True
                lblIPRange.Text = "IP Range: 172.16.34.161 - 172.16.34.190"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224"
                lblDefaultGateway.Text = "Default Gateway: 172.16.34.254"
            Case DropDownList1.SelectedItem.ToString = "Woodlawn"
                GrdWoodlawn.Visible = True
                lblIPRange.Text = "IP Range: 10.10.120.X"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.0"
                lblDefaultGateway.Text = "Default Gateway: 10.1.120.254"
            Case DropDownList1.SelectedItem.ToString = "West 21st"
                GrdWest21.Visible = True
                lblIPRange.Text = "IP Range: 172.16.35.161 - 172.16.35.190"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224"
                lblDefaultGateway.Text = "Default Gateway: 172.16.35.161"
            Case DropDownList1.SelectedItem.ToString = "Maize"
                GrdMaize.Visible = True
                lblIPRange.Text = "IP Range: 172.22.76.1 - 172.22.76.254"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.0"
                lblDefaultGateway.Text = "Default Gateway: 172.22.76.254"
            Case DropDownList1.SelectedItem.ToString = "Goddard"
                grdGoddard.Visible = True
                lblIPRange.Text = "IP Range: 172.16.35.129 - 172.16.35.158"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.224 "
                lblDefaultGateway.Text = "Default Gateway: 172.16.35.129"
            Case DropDownList1.SelectedItem.ToString = "Salina"
                grdSalina.Visible = True
                lblIPRange.Text = "IP Range: 10.15.20.X"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.0"
                lblDefaultGateway.Text = "Default Gateway: 10.15.20.254"
            Case DropDownList1.SelectedItem.ToString = "Hutchinson"
                grdHutchinson.Visible = True
                lblIPRange.Text = "IP Range: 10.16.20.X"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.0"
                lblDefaultGateway.Text = "Default Gateway: 10.16.20.254"
            Case DropDownList1.SelectedItem.ToString = "Pratt"
                GrdPratt.Visible = True
                lblIPRange.Text = "IP Range: 10.17.20.X"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.0"
                lblDefaultGateway.Text = "Default Gateway: 10.17.20.255"
            Case DropDownList1.SelectedItem.ToString = "East 21st"
                GrdEast21.Visible = True
                lblIPRange.Text = "IP Range: "
                lblSubnetMask.Text = "Subnet Mask: "
                lblDefaultGateway.Text = "Default Gateway: "
            Case DropDownList1.SelectedItem.ToString = "Corporate HQ"
                GrdCorporate.Visible = True
                lblIPRange.Text = "IP Range: 172.16.52.X"
                lblSubnetMask.Text = "Subnet Mask: 255.255.255.0"
                lblDefaultGateway.Text = "Default Gateway: 172.16.52.254"
            Case Else

        End Select
        GrdPrinters.Visible = True
    End Sub
End Class
