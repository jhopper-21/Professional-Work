<%@ Page Language="VB" AutoEventWireup="false" CodeFile="IPSheet.aspx.vb" Inherits="site_IPSheetNew" debug="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>IP Spreadsheet</title>
     <link rel="shortcut icon" type="image/x-icon" href="~/hnet.com-image.ico" />
    <style type="text/css">
        .GRIDVIEW{
            border-radius: 15px;
            font-family:'Microsoft JhengHei UI';
            background-color: whitesmoke;
               
                
        }
        .auto-style3 {
            width: 800px;
            border: 1px solid #c0c0c0;
        }
        .auto-style4 {
            width: 173px;
            height: 24px;
        }
        .auto-style5 {
            width: 173px;
            height: 23px;
        }
        .auto-style12 {
            width: 188px;
            height: 23px;
        }
        .auto-style14 {
            width: 257px;
            height: 23px;
        }
        .auto-style15 {
            width: 257px;
            height: 24px;
        }
         .auto-style17 {
            width: 17%;
            float: left;
            padding: 15px;
        }
        .auto-style19 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #3282f7;
            margin: 50px;
            color: white;
            padding: 5px 15px;
            text-align: left;
            text-decoration: none;
            display: inline-block;
            font-size: 8px;
            margin: 4px 2px;
            cursor: pointer;
        }
      
        .auto-style20 {
            margin-right: 0px;
        }
      
        .auto-style21 {
            width: 20%;
            float: left;
            padding: 0px;
            text-align: left;
        }
      
        .auto-style22 {
            text-decoration: underline;
        }
      
        </style>
</head>
    <link rel="stylesheet" href="../Stylesheets/EmpOBButtons.css" />
<body>
    <h1> IP Spreadsheet</h1>   
    <div class="auto-style17">
         <form action="home.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit1" class="button" type="submit" value="Home" /></form> 
         <form action="IPSheet.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit1" class="button" type="submit" value="IP Spreadsheet" /></form>   
        <form action="UserSearch.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit2" class="button" type="submit" value="User Search" /></form>
   
       <%-- <form action="Stats.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit1" class="button" type="submit" value="Statistics" /></form>--%>
      </div>         
         
   <form id="form2"  runat="server">
       <div>
           <asp:Button ID="Button3" runat="server" CssClass="auto-style19" backcolor="#6cc551" Text="Add Workstation" Width="140px" Font-Size="10pt" Height="28px" />
       &nbsp;</div>
        <div class="auto-style21"
        <h2><table class="auto-style3">
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblLocation" runat="server" Text="Search by location:"></asp:Label>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="lblName" runat="server" Text="Search by name:"></asp:Label>
                    </td>
                    <td class="auto-style14">
                        <asp:Label ID="lblIP" runat="server" Text="Search by IP address:"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="FillDropDownList" DataTextField="BranchName" DataValueField="BranchCode">
        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtName" runat="server" AutoPostBack="True"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnSeachName" CssClass="BU" runat="server" Text="Submit" />
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtIP" runat="server" AutoPostBack="True"></asp:TextBox>
                        <asp:Button ID="btnSearchIP" runat="server" Text="Submit" />
                    </td>
                </tr>
            </table>
            
            <strong>
            
            <asp:Label ID="lblIPRange" runat="server" Width="798px" text-align="center" Font-Names="Microsoft JhengHei UI" Font-Size="12pt" BackColor="Snow" BorderStyle="Ridge"></asp:Label>
            </strong>
            <br />
            <strong>
            <asp:Label ID="lblSubnetMask" runat="server" Width="798px" text-align="center" Font-Names="Microsoft JhengHei UI" Font-Size="12pt" BackColor="Snow" BorderStyle="Ridge"></asp:Label>
            <asp:Label ID="lblDefaultGateway" runat="server" Width="798px" text-align="center" Font-Names="Microsoft JhengHei UI" Font-Size="12pt" BackColor="Snow" BorderStyle="Ridge"></asp:Label>
            </strong>
            <br /> <br />
            <asp:AccessDataSource ID="FillDropDownList" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT [BranchName], [BranchCode] FROM [Locations]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="SearchByName" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT * FROM [Workstations] WHERE ([WorkstationName] = ?)" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtName" Name="WorkstationName" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="SearchByIP" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT * FROM [Workstations] WHERE ([IPAddress] = ?)" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?" OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtIP" Name="IPAddress" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="original_ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DelanoWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT * FROM [Workstations] WHERE (([IPAddress] LIKE '%' + ? + '%') OR ([IPAddress] LIKE '%' + ? + '%') OR([IPAddress] LIKE '%' + ? + '%'))" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="172.16.8" Name="IPAddress" Type="String" />
                    <asp:Parameter DefaultValue="10.1.40" Name="IPAddress2" Type="String" />
                    <asp:Parameter DefaultValue="10.1.120" Name="IPAddress3" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID"  Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="GreatBendWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations Where WorkstationName Like '%CUA-GB%' AND WorkstationName NOT LIKE '%CUA-GBPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="NorthRockWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName LIKE '%CUA-E5%' OR WorkstationName LIKE '%CUA-NR%' OR WorkstationName LIKE '%NRock%' AND WorkstationName NOT LIKE '%CUA-NRPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="RidgeRoadWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName LIKE '%CUA-W4%' OR WorkstationName LIKE '%RIDGERD%' OR WorkstationName LIKE '%CUA-RR%' AND WorkstationName NOT LIKE '%CUA-RRPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DerbyWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE IPAddress LIKE '%' &amp; '10.8.' &amp; '%'  OR WorkstationName LIKE '%DERBY%' AND WorkstationName NOT LIKE '%CUA-DBPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="West21Workstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName LIKE '%' &amp; 'W21'  &amp; '%' or WorkstationName LIKE '%' &amp; 'CUA-WE' &amp; '%'  AND WorkstationName NOT LIKE '%' &amp; 'CUA-WEB' &amp; '%' AND WorkstationName NOT LIKE '%CUA-WEPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="MaizeWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE  WorkstationName LIKE '%MAIZE%' OR IPAddress LIKE '%' &amp; '172.22.76' &amp; '%' AND WorkstationName NOT LIKE '%CUA-MAPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="GoddardWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName LIKE '%' &amp; 'CUA-GO' &amp; '%' AND WorkstationName NOT LIKE '%CUA-GOPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="SalinaWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE IPAddress LIKE '%' &amp; '10.15.20' &amp; '%' OR IPAddress LIKE '%' &amp; '10.15.120.' &amp; '%' AND WorkstationName NOT LIKE '%CUA-SAPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="HutchinsonWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE IPAddress LIKE '%' &amp; '10.16.20.' &amp; '%' OR IPAddress LIKE '%' &amp; '10.16.120' &amp; '%' AND WorkstationName NOT LIKE '%CUA-HUPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="PrattWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName NOT LIKE '%PRPRINT%' and IPAddress LIKE '%' &amp; '10.17.20.' &amp; '%' OR IPAddress LIKE '%' &amp; '10.17.120' &amp; '%' " DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="East21Workstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE IPAddress LIKE '%' &amp; '10.18.20' &amp; '%' OR IPAddress LIKE '%' &amp; '10.18.120.' &amp; '%' AND WorkstationName NOT LIKE '%CUA-EEPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="CorporateWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE IPAddress LIKE '%' &amp; '172.16.52.' &amp; '%' OR IPAddress LIKE '%' &amp; '10.81.120.' &amp; '%' AND WorkstationName NOT LIKE '%CUA-HQPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="Printers" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT * FROM Workstations Where WorkstationName LIKE '%' &amp; ? &amp; 'PRINT' &amp; '%' OR WorkstationName LIKE '%' &amp; ? &amp; 'DATACARD' &amp; '%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="?" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="?" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="WoodlawnWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName LIKE '%' &amp; 'CUA-WO' &amp; '%' OR IPAddress LIKE '%' &amp; '10.10.' &amp; '%' AND WorkstationName NOT LIKE '%CUA-WOPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="EastHarryWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName LIKE '%CUA-SE%' and WorkstationName NOT LIKE '%' &amp; 'CUA-SERVER' &amp; '%' AND WorkstationName NOT LIKE '%CUA-EHPRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="SouthBroadwayWorkstations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="Select * From Workstations WHERE WorkstationName LIKE '%CUA-S6%' OR WorkstationName LIKE '%SB%' AND WorkstationName NOT LIKE '%PRINT%'" DeleteCommand="DELETE FROM [Workstations] WHERE [ID] = ?" InsertCommand="INSERT INTO [Workstations] ([ID], [InventoryTag], [WorkstationName], [IPAddress]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Workstations] SET [InventoryTag] = ?, [WorkstationName] = ?, [IPAddress] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InventoryTag" Type="String" />
                    <asp:Parameter Name="WorkstationName" Type="String" />
                    <asp:Parameter Name="IPAddress" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:GridView ID="GrdName" runat="server" CssClass="GRIDVIEW" CellPadding="4" ForeColor="#333333" GridLines="None" Width="812px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SearchByName" PageSize="25" Visible="False" AllowSorting="True" BackColor="WhiteSmoke" BorderColor="Black" BorderStyle="Ridge" Font-Bold="True" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="False" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdIP" runat="server" CellPadding="4" ForeColor="#003183" GridLines="None" Width="812px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SearchByIP" PageSize="25" Visible="False" Font-Names="Microsoft JhengHei UI" CssClass="auto-style22">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdDelano" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DelanoWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdGreatBend" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="GreatBendWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#003183" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                        <asp:GridView ID="GrdNorthRock" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="NorthRockWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdRidgeRoad" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="RidgeRoadWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdSouthBroadway" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SouthBroadwayWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
<asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="grdEastHarry" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="EastHarryWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="grdDerby" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DerbyWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdWoodlawn" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="WoodlawnWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdWest21" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="West21Workstations" EnableSortingAndPagingCallbacks="True" ForeColor="#003183" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdMaize" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="MaizeWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                        <asp:GridView ID="grdGoddard" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="GoddardWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" CssClass="auto-style20" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="grdSalina" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SalinaWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="grdHutchinson" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="HutchinsonWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdPratt" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PrattWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:GridView ID="GrdEast21" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="East21Workstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                        <asp:GridView ID="GrdCorporate" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="CorporateWorkstations" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                                    <asp:GridView ID="GrdPrinters" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Printers" EnableSortingAndPagingCallbacks="True" ForeColor="#333333" GridLines="None" PageSize="15" Visible="False" Width="812px" DataKeyNames="ID" Font-Names="Microsoft JhengHei UI">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="InventoryTag" HeaderText="Inventory Tag" SortExpression="InventoryTag" />
                    <asp:BoundField DataField="WorkstationName" HeaderText="Workstation Name" SortExpression="WorkstationName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IP Address" SortExpression="IPAddress" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#003183" Font-Bold="True" ForeColor="White" Font-Names="Microsoft JhengHei UI" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>




        </div>
        </form>
              
</html>
