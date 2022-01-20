<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_user.aspx.cs" Inherits="add_user" %>

<!DOCTYPE html>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<link rel="stylesheet" href="style.css">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>اضافة مستخدم</title>
    <style>
        body{
            margin-top:0px;
            width:100%
        }
    html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:cover;
              
        }
    .btn{
            color:white;
            width:50px;
            height:30px;
            margin:10px;
            background-color:#307a79;
            border:2px solid white;
            transition:0.5s;
            font-weight:bold;
            font-size:15px;
            border-radius:10%;
            }
        .btn:hover{
            
            color:#307a79;
            background-color:white;
            border:2px solid #307a79;
        }
        .table {
            border-radius:5%;
            width: 294px;
            margin-top:90px;
            background-color:rgba(48, 122, 121,0.5);
            border:solid 2px white;
            margin-right:auto;
            margin-left:auto;

        }
        .auto-style2 {
            width: 96px;
            text-align: left;
            font-weight: bold;
        }
        table td{
            height:30px;
        }
       
        hr{
            border:1px solid white;
            
        }
        .auto-style4 {
            text-align: center;
        }
          #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(48, 122, 121,0.15);
      border-bottom:3px solid white;
      
  }
        .auto-style5 {
            text-align: center;
            font-weight: bold;
        }
        .auto-style6 {
            text-align: left;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header" class="auto-style4">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
         <input type="checkbox" id="check">
    <label for="check">
      <i class="fas fa-bars" id="btn"></i>
      <i class="fas fa-times" id="cancel"></i>
    </label>
    <div class="sidebar">
   
    <ul>
        <li class="sp">تركيب</li>
        <li><a href="add_client.aspx">اضافة جديد<i class="fas fa-plus"></i></a></li>
        <li><a href="add_edit.aspx">تعديل<i class="fas fa-edit"></i></a></li>
        <li><a href="report1.aspx">طباعة تقرير<i class="fas fa-print"></i></a></li>
        <li class="sp">صيانة</li>
        <li><a href="add_maint.aspx">اضافة جديد<i class="fas fa-plus"></i></a></li>
        <li><a href="edit_maint.aspx">تعديل<i class="fas fa-edit"></i></a></li>
        <li><a href="report2.aspx">طباعة تقرير<i class="fas fa-print"></i></a></li>
    </ul>
</div>
        <table align="center" class="table" dir="rtl">
            <tr>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_name" runat="server" style="text-align: left"></asp:TextBox>
                </td>
                <td class="auto-style2"><strong>Name</strong></td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_email" runat="server" style="text-align: left"></asp:TextBox>
                </td>
                <td class="auto-style2">Use name</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_pass" runat="server" style="text-align: left"></asp:TextBox>
                </td>
                <td class="auto-style2">password</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_passconfirm" runat="server" style="text-align: left"></asp:TextBox>
                </td>
                <td class="auto-style2">confirm pass</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lbl_message" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2">
                    <hr />
                    <strong>
                    &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" CssClass="btn"  OnClick="Button1_Click" Text="Add"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" CssClass="btn"  Text="Back" OnClick="Button2_Click" />
                    &nbsp;</strong></td>
            </tr>
        </table>
    
    </form>
</body>
</html>
