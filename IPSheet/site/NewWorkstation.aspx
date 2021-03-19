<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewWorkstation.aspx.vb" Inherits="site_NewWorkstation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Device Setup</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/hnet.com-image.ico" />
    <link rel="stylesheet" href="../Stylesheets/EmpOBButtons.css" />
    <style type="text/css">
        .auto-style1 {
            width: 80%;
            border: 1px solid #c0c0c0;
            
        }
        .auto-style2 {
            width: 136px;
            text-align: right;
        }
        .auto-style3 {
            width: 1062px;
        }
        .auto-style4 {
            width: 136px;
            text-align: right;
            height: 26px;
        }
        .auto-style5 {
            width: 1062px;
            height: 26px;
        }
        .TextBox {
            width: 150px;
            font-family: Trebuchet MS, Helvetica, sans-serif;
            padding: 5px 5px;
            margin: 8px 0;
            box-sizing: border-box;
            border-radius: 15px;
            border-bottom: 2px;
            border-bottom-color: black;
        }
        .select {
            -webkit-border-radius:24px;
             -moz-border-radius:24px;
              border-radius:24px;
        }
          .labelstyle{
            font-family:'Microsoft JhengHei UI'
        }
          .auto-style17 {
            width: 15%;
            float: left;
            padding: 15px;
        }
        </style>
</head>
<body>
    <h1>Device Setup</h1> 
       <div class="auto-style17">
         <form action="home.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit6" class="button" type="submit" value="Home" /></form> 
         <form action="IPSheet.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit5" class="button" type="submit" value="IP Spreadsheet" /></form>   
        <form action="UserSearch.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit2" class="button" type="submit" value="User Search" /></form>
        
       <%-- <form action="Stats.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit7" class="button" type="submit" value="Statistics" /></form>--%>
      </div>         
    <form id="form1" runat="server">
        <div>        
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblInventoryID" runat="server" CssClass="labelstyle" Text="Inventory tag:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtInventory" class="TextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblWorkstationName" runat="server" CssClass="labelstyle" Text="Workstation name:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtWorkstationName" class="TextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblIPAddress" runat="server" class="TextBox" CssClass="labelstyle" Text="IP address:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtIP" class="TextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblWorkstationModel" runat="server" CssClass="labelstyle" Text="Workstation model:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="ddlModel" runat="server" DataSourceID="FillDDL0" DataTextField="WorkstaionModel" DataValueField="WorkstaionModel">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="FillDDL0" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT [WorkstaionModel] FROM [Devices]"></asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblDateDeployed" runat="server" class="TextBox" CssClass="labelstyle" Text="Date deployed:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" DayNameFormat="FirstLetter" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="137px" NextPrevFormat="ShortMonth" Width="430px">
                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                            <DayStyle BackColor="#CCCCCC" />
                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                            <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                            <TodayDayStyle BackColor="#999999" ForeColor="White" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblBranch" runat="server" class="TextBox" CssClass="labelstyle" Text="Branch:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="select"  DataSourceID="FillDDL" DataTextField="BranchName" DataValueField="BranchID" Height="30px" Width="150px">
                        </asp:DropDownList>
                        <asp:AccessDataSource ID="FillDDL" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT * FROM [Locations]"></asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="button1" Text="Submit" Width="188px" Font-Size="11pt" Height="37px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
