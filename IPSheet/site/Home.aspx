<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Home.aspx.vb" Inherits="test" Debug="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../Stylesheets/EmpOBButtons.css" /> 
    <title>Home</title>
    <style>
        .dropdown {
  position: relative;
  display: inline-block;
  margin: 0 auto; 
 
}

.dropdown-content {
  display: none;
  position:center;
  background-color: #f9f9f9;
  min-width: 250px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  
  z-index: 1;
  
}

.dropdown:hover .dropdown-content {
  display: block;
  position: fixed;
  position:center
}

.button2 {
    background-color: #3282f7;
    text-decoration: wavy;
    margin: 50px;
    border: none;
    color: white;
    padding: 16px 32px;
    width: 300px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    opacity: 1;
}
        .inner {
  width: 50%;
  margin: 0 auto;
}


        .auto-style1 {
             
  top: 50%;
  bottom: 50%;
 
            text-align: center;
                     
        }


    </style>
     <link rel="shortcut icon" type="image/x-icon" href="~/hnet.com-image.ico" />
</head>
<body>
    <h1> CUA IT Support Webpage </h1>
   
      
        <div class="column">
        <form action="home.aspx" method="get"
        <input type="submit" value="submit" />
        </div>
        <div>
            </form> 
         &nbsp;<form action="IPSheet.aspx" method="get"
             </div>

    <div class="auto-style1">
             <div class="dropdown">
        <input id="Submit1" class="button2" type="button" value="Workstation Management" />
                 <div class="dropdown-content">
                     <a style="font-family:'Microsoft JhengHei'" href="IPSheet.aspx">IP Spreadsheet</a>
                     <br />
                     <br />
                      <a style="font-family:'Microsoft JhengHei'" href="NewWorkstation.aspx">Device Setup</a>
                     </div>
                 </div> 

    <div class="dropdown" >
        <input id="Submit" type="button" class="button2" value="User Management"  />
                 <div class="dropdown-content">
                     <a style="font-family:'Microsoft JhengHei'" href="Usersearch.aspx">User Spreadsheet</a>
                     <br />
                     <br />
                      <a style="font-family:'Microsoft JhengHei'" href="NewUser.aspx">User Setup</a>
                     </div>
                 </div> 
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
       
        </div>
   <%-- <div class="auto-style1">
         <div class="dropdown" >
        <input id="Submit2" type="button" class="button2" value="Statistics" />
                 <div class="dropdown-content">
                     <a style="font-family:'Microsoft JhengHei'" href="BranchStats.aspx">Branch Statistics</a>
                     <br />
                     <br />
                      <a style="font-family:'Microsoft JhengHei'" href="OverallStats.aspx">Overall Statistics</a>
                     </div>
                 </div> 
    </div>--%>
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="auto-style1">

        <img  src="../Images/CUA.png" />
    </div>
       
   
</body>
</html>
