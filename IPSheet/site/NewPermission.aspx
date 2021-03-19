<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewPermission.aspx.vb" Inherits="site_NewWorkstation" %>

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
            width: 218px;
            text-align: right;
        }
        .auto-style3 {
            width: 1062px;
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
        .text {
            width: 188px;
            text-align: right;
            font-family: "Microsoft JhengHei UI";
        }
        .auto-style18 {
            width: 218px;
            text-align: right;
            font-family: "Microsoft JhengHei UI";
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
                    <td class="auto-style18">
                        Permission Number:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtNumber" class="TextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        Permission Name:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtName" class="TextBox" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        Permission Description (Optional):</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtDescription" runat="server" Height="54px" Width="222px"></asp:TextBox>
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
