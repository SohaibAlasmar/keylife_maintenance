<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<%@ Import Namespace="System.Data.SqlClient" %> 
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
     
    <meta charset="utf-8"/>
    <title>تسجيل دخول</title>
     <link rel="shortcut icon" type="image/x-icon" href="images/logo-1.ico" />
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style_login.css"/>
  
      </head>
  <body >
      <form runat="server">
          <div class="row">
          <div id="header" class="text-center">
              <br />
              <asp:Image CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px"/>
              </div>
          </div>
          
<div class="row">
<div class="login-box col-md-3">
  <h1>Login</h1>
  <div class="textbox">
    <i class="fas fa-user"></i>
    
      <asp:TextBox ID="textuser" CssClass="form-control" placeholder="Login username" runat="server"></asp:TextBox>
  </div>

  <div class="textbox ">
    <i class="fas fa-lock"></i>
    <asp:TextBox ID="textpass" CssClass="form-control " TextMode="Password" placeholder="Login password" runat="server"></asp:TextBox>
  </div>
    <div class="text-center">
        <asp:Label ID="lbl_eror" runat="server" ForeColor="Red"></asp:Label>
    </div>
  
    <asp:Button ID="btn_login" OnClick="btn_login_Click" class="btn" runat="server" Text="Sign in" />
</div>
         </div>
          </form>
  </body>
</html>
