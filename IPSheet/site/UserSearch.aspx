<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UserSearch.aspx.vb" Inherits="site_UserSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CUA User Search</title>
     <link rel="shortcut icon" type="image/x-icon" href="~/hnet.com-image.ico" />
    <style type="text/css">
        .auto-style3 {
            width: 350%;
            border: 1px solid #c0c0c0;
        }
        .auto-style14 {
            width: 308px;
            height: 23px;
        }
         .auto-style15 {
            width: 308px;
            height: 24px;
        }
         .auto-style16 {
            float: right;
            width: 80%;
           
        }
          .auto-style17 {
            width: 17%;
            float: left;
            padding: 15px;
        }
        .auto-style19 {
            width: 515px;
            height: 24px;
        }
        .auto-style20 {
            text-align: center;
        }
        .auto-style21 {
            width: 387%;
        }
        .auto-style22 {
            width: 758px;
        }
        .auto-style23 {
            height: 41px;
        }
        .auto-style24 {
            width: 301px;
            height: 23px;
        }
        .auto-style25 {
            width: 301px;
            height: 24px;
        }
        </style>
</head>
    <link rel="stylesheet" href="../Stylesheets/EmpOBButtons.css" />
<body>
    
    <h1> User Search</h1>  
    
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
         
    <form id="form2" class="auto-style16" runat="server">
         <div>
           <asp:Button ID="btnAddUser" runat="server" CssClass="auto-style19" backcolor="#6cc551" Text="Add User" Width="140px" Font-Size="10pt" Height="28px" ForeColor="White" />
           <asp:Button ID="btnAddPermission" runat="server" backcolor="#6cc551" Text="New Permission Group" Width="196px" Font-Size="10pt" Height="28px" ForeColor="White" />
       </div>
         
        <div class="column"
        <h2><table class="auto-style3">
                <tr>
                    <td class="auto-style24">
                        Search by First or Last Name:</td>
                    <td class="auto-style14">
                        Search by User ID:</td>
                    <td class="auto-style14">
                        Search Permission Group:</td>
                </tr>
                <tr>
                   
                    <td class="auto-style25">
                        <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnNameSearch" CssClass="BU" runat="server" Text="Submit" />
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="True" Width="134px"></asp:TextBox>
                        <asp:Button ID="btnIDSearch" runat="server" Text="Submit" />
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtPermissionSearch" runat="server" AutoPostBack="True" Width="134px"></asp:TextBox>
                        <asp:Button ID="btnPermissionSearch" runat="server" Text="Submit" />
                    </td>
                </tr>
            </table>
            </h2>
            <asp:AccessDataSource ID="PermissionGroups" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT [PermissionNumber], [PermissionTitle] FROM [PermissionGroup] WHERE ([PermissionNumber] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtPermissionSearch" Name="PermissionNumber" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:AccessDataSource>
            <br />
            <asp:AccessDataSource ID="SearchByUserID" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT [EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeLogin], [EmployeePermission], [ID] FROM [Employee] WHERE ([EmployeeID] = ?)" DeleteCommand="DELETE FROM [Employee] WHERE [ID] = ?" InsertCommand="INSERT INTO [Employee] ([EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeLogin], [EmployeePermission], [ID]) VALUES (?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Employee] SET [EmployeeID] = ?, [EmployeeFirstName] = ?, [EmployeeLastName] = ?, [EmployeeLogin] = ?, [EmployeePermission] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="EmployeeFirstName" Type="String" />
                    <asp:Parameter Name="EmployeeLastName" Type="String" />
                    <asp:Parameter Name="EmployeeLogin" Type="String" />
                    <asp:Parameter Name="EmployeePermission" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="EmployeeID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="EmployeeFirstName" Type="String" />
                    <asp:Parameter Name="EmployeeLastName" Type="String" />
                    <asp:Parameter Name="EmployeeLogin" Type="String" />
                    <asp:Parameter Name="EmployeePermission" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="SearchByEmpName" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT [EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeLogin], [EmployeePermission], [ID] FROM [Employee] WHERE (([EmployeeFirstName] LIKE '%' + ? + '%') OR ([EmployeeLastName] LIKE '%' + ? + '%'))" DeleteCommand="DELETE FROM [Employee] WHERE [ID] = ?" InsertCommand="INSERT INTO [Employee] ([EmployeeID], [EmployeeFirstName], [EmployeeLastName], [EmployeeLogin], [EmployeePermission], [ID]) VALUES (?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Employee] SET [EmployeeID] = ?, [EmployeeFirstName] = ?, [EmployeeLastName] = ?, [EmployeeLogin] = ?, [EmployeePermission] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="EmployeeFirstName" Type="String" />
                    <asp:Parameter Name="EmployeeLastName" Type="String" />
                    <asp:Parameter Name="EmployeeLogin" Type="String" />
                    <asp:Parameter Name="EmployeePermission" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </InsertParameters>
                <SelectParameters >
                    <asp:ControlParameter  ControlID="TextBox1"  Name="EmployeeFirstName" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="EmployeeLastName" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="EmployeeFirstName" Type="String" />
                    <asp:Parameter Name="EmployeeLastName" Type="String" />
                    <asp:Parameter Name="EmployeeLogin" Type="String" />
                    <asp:Parameter Name="EmployeePermission" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
        </h2>
          
            <div class="auto-style20">
                <table class="auto-style21">
             <tr>
                 <td class="auto-style22" rowspan="2">
          
            <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="650px" AutoGenerateColumns="False" DataSourceID="SearchByUserID" PageSize="25" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="User ID" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="EmployeeFirstName" HeaderText="First Name" SortExpression="EmployeeFirstName" />
                    <asp:BoundField DataField="EmployeeLastName" HeaderText="Last Name" SortExpression="EmployeeLastName" />
                    <asp:BoundField DataField="EmployeeLogin" HeaderText="Windows Username" SortExpression="EmployeeLogin" />
                    <asp:BoundField DataField="EmployeePermission" HeaderText="Episys Permissions" SortExpression="EmployeePermission" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                       <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="650px" AutoGenerateColumns="False" DataSourceID="SearchByEmpName" PageSize="25" DataKeyNames="ID">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="User ID" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="EmployeeFirstName" HeaderText="First Name" SortExpression="EmployeeFirstName" />
                    <asp:BoundField DataField="EmployeeLastName" HeaderText="Last Name" SortExpression="EmployeeLastName" />
                    <asp:BoundField DataField="EmployeeLogin" HeaderText="Windows Username" SortExpression="EmployeeLogin" />
                    <asp:BoundField DataField="EmployeePermission" HeaderText="Episys Permissions" SortExpression="EmployeePermission" />
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
                 </td>
                 <td class="auto-style23">
                     <br />
                     <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PermissionGroups" ForeColor="#333333" GridLines="None" Height="16px" Width="333px">
                         <AlternatingRowStyle BackColor="White" />
                         <Columns>
                             <asp:BoundField DataField="PermissionNumber" HeaderText="Permission Group" />
                             <asp:BoundField DataField="PermissionTitle" HeaderText="Name" />
                         </Columns>
                         <EditRowStyle BackColor="#2461BF" />
                         <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                         <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                         <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                         <RowStyle BackColor="#EFF3FB" />
                         <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                         <SortedAscendingCellStyle BackColor="#F5F7FB" />
                         <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                         <SortedDescendingCellStyle BackColor="#E9EBEF" />
                         <SortedDescendingHeaderStyle BackColor="#4870BE" />
                     </asp:GridView>
                    
                 </td>
             </tr>
             <tr>
                 <td>
                     &nbsp;</td>
             </tr>
             <tr>
                 <td class="auto-style22">
                
           
                 </td>
                 <td>&nbsp;</td>
             </tr>
         </table>
          
                </div>
            <div class="auto-style20">
                
            </div>
        </div>
        </form>
              
</html>

<%--</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>
