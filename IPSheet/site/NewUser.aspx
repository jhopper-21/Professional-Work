<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewUser.aspx.vb" Inherits="EmployeeOB"  Debug="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Onboard/Offboard</title>
    <link rel="shortcut icon" type="image/x-icon" href="~/hnet.com-image.ico" />
  <style>
      .EmpOBTextBox {
    width: 150px;
    font-family: Trebuchet MS, Helvetica, sans-serif;
    padding: 5px 5px;
    margin: 8px 0;
    box-sizing: border-box;
    border-radius: 15px ;
    border-bottom: 2px;
    border-bottom-color: black;
}
      .auto-style17 {
            width: 17%;
            float: left;
            padding: 15px;
        }
      .auto-style18 {
          width: 100%;
          border: 1px solid #c0c0c0;
      }
      .auto-style19 {
          height: 50px;
      }
      .auto-style20 {
          width: 77px;
      }
      .auto-style21 {
          height: 50px;
          width: 77px;
      }
      .auto-style22 {
          width: 25%;
          float: left;
          padding: 0px;
          text-align: justify;
      }
       .auto-style23 {
          width: 10%;
          float: left;
          padding: 0px;
      }
  </style>

</head>
     <link rel="stylesheet" href="../Stylesheets/EmpOBButtons.css" />
<body>
    <h1> Create User </h1>
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
        
        <%--<form action="Stats.aspx" method="get"
        <input type="submit" value="submit" />
        <input id="Submit7" class="button" type="submit" value="Statistics" /></form>--%>
      </div>         
         
       <form id="form1" runat="server">
        <div aria-busy="False" class="auto-style22">
        <br />
            <table class="auto-style18">
                <tr>
                    <td class="auto-style20">User ID:</td>
                    <td>
            <asp:TextBox ID="txtUserID" class="EmpOBTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Employee First Name:</td>
                    <td class="auto-style19">
            <asp:TextBox ID="txtFirstName" class="EmpOBTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Employee Last Name:</td>
                    <td class="auto-style19">
            <asp:TextBox ID="txtLastName" class="EmpOBTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Employee Login:</td>
                    <td class="auto-style19">
            <asp:TextBox ID="txtUsername" class="EmpOBTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Temporary Password:</td>
                    <td class="auto-style19">
            <asp:TextBox ID="txtPassword" class="EmpOBTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Extension:
            </td>
                    <td class="auto-style19">
            <asp:TextBox ID="txtExtension" class="EmpOBTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Direct Line:</td>
                    <td class="auto-style19">
            <asp:TextBox ID="txtDirectLine" class="EmpOBTextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Employee Permissions:</td>
                    <td class="auto-style19">
            <asp:DropDownList ID="ddlPermission" runat="server" DataSourceID="Positions" DataTextField="RoleName" DataValueField="RolePermission">
            </asp:DropDownList>
        
                        <br />
        
            <asp:AccessDataSource ID="Positions" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT [RoleName], [RolePermission] FROM [Role]">
            </asp:AccessDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Location (ARCU Only):           
            </td>
                    <td class="auto-style19">           
            <asp:DropDownList ID="ddlLocation" runat="server" DataSourceID="Locations" DataTextField="BranchName" DataValueField="BranchID">
            </asp:DropDownList>
        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="105px" />
        
                    </td>
                    <td class="auto-style19">
        
            <asp:AccessDataSource ID="Locations" runat="server" DataFile="~/App_Data/CUA.mdb" SelectCommand="SELECT [BranchName], [BranchID] FROM [Locations]">
            </asp:AccessDataSource>
                    </td>
                </tr>
            </table>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControltoValidate="txtUserID" runat="server" ErrorMessage="User ID cannot be blank." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControltoValidate="txtFirstName" runat="server" ErrorMessage="First name cannot be blank." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControltoValidate="txtLastName" runat="server" ErrorMessage="Last name cannot be blank." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControltoValidate="txtUsername" runat="server" ErrorMessage="Username cannot be blank." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControltoValidate="txtPassword" runat="server" ErrorMessage="Password cannot be blank." ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControltoValidate="txtExtension" runat="server" ErrorMessage="Extension cannot be blank. Use N/A for users without an extension." ForeColor="Red"></asp:RequiredFieldValidator>
             <br />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControltoValidate="ddlPermission" runat="server" ErrorMessage="Permissions cannot be blank. Use N/A for users with no Episys permissions." ForeColor="Red"></asp:RequiredFieldValidator>        
        </div>
           <div class="auto-style23">

             <asp:Label ID="Label2" runat="server" Text="Label" Visible="False" Width="1000px"></asp:Label>
               <br />
            <asp:Label ID="Label1" runat="server" BackColor="White" BorderColor="Black" BorderWidth="2px" Height="480px" Width="500px" Visible="False"></asp:Label>
               <br />
                 <asp:Button ID="btnSend" runat="server" Text="Send E-mail" Visible="False" Width="105px" />
           </div>
    </form>
</body>
</html>
