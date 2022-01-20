<%@ Page Language="C#" AutoEventWireup="true"   %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<script runat="server">
    SqlConnection con = new SqlConnection("");

    protected void Button2_Click(object sender, EventArgs e)
    {

        string gov=txt_Govern.Text.ToString();
        string loc=txt_location.Text.ToString();



        string sql = "insert into client values(N'"+gov+"',N'"+loc+"','"+theColor.Value.ToString()+"')";
        SqlCommand cmd=new SqlCommand(sql,con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        lbl_message.Text="تمت الاضافة بنجاح";
        Response.Redirect("main.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx");
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("main.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    public static string HexToColor(string hexString)
    {
        if (hexString != "")
        {
            //replace # occurences
            if (hexString.IndexOf('#') != -1)
                hexString = hexString.Replace("#", "");

            int r, g, b = 0;

            r = int.Parse(hexString.Substring(0, 2), System.Globalization.NumberStyles.AllowHexSpecifier);
            g = int.Parse(hexString.Substring(2, 2), System.Globalization.NumberStyles.AllowHexSpecifier);
            b = int.Parse(hexString.Substring(4, 2), System.Globalization.NumberStyles.AllowHexSpecifier);
            string rgb = "rgba(" + r + "," + g + "," + b + ",0.15)";
            return rgb;
        }
        string nice = "";
        return nice;
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>تعديل معلومات مواد</title>
    <style>
        
    .btn {
        color: white;
        margin: 10px;
        background-color: rgba(0, 0, 0,0.6);
        border: 2px solid white;
        transition: 0.5s;
        font-weight: bold;
        font-size: 15px;
        border-radius: 15px;
        width: 100px;
        height: 60px;
        margin: 20px 40px;
        text-align: center;
        line-height:60px
    }

        .btn:hover {
            color: rgba(0, 0, 0,0.6);
            background-color: white;
            border: 2px solid rgba(0, 0, 0,0.6);
        }

    #new {
        list-style: none;
        display: none;
        margin: 0px;
        position: relative;
        right: 62px;
        bottom:40px;
    }

        #new li {
            transition: 0.5s;
            margin: 0px;
        }

    .btn1 {
        color: white;
        margin: 10px;
        background-color: rgba(0, 0, 0,0.6);
        border: 2px solid white;
        transition: 0.5s;
        font-weight: bold;
        font-size: 15px;
        border-radius: 15px;
        width: 70px;
        height: 30px;
        margin: 20px 40px;
        text-align: center;
        line-height: 30px;
    }

        .btn1:hover {
            color: rgba(0, 0, 0,0.6);
            background-color: white;
            border: 2px solid rgba(0, 0, 0,0.6);
        }

    #new li a {
        text-decoration: none;
        color: white
    }

        #new li a:hover {
            color: rgba(0, 0, 0,0.6);
        }

    nav:hover #new {
        display: block
    }
         body{
            margin:0px;
            width:100%;
            padding:0px;
        }
         html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:100% 100%;
              
        }
        .auto-style1 {
            text-align: center;
        }
        .table {
            margin-top:90px;
            width: 300px;
            background-color:rgba(0, 0, 0,0.2);
            border-radius:5%;
            border:solid 2px white;
        }
        hr{
            border:1px solid white;
            
        }
        table td{
        }
        .btn2{
            color:white;
            margin:10px;
            background-color:rgba(0, 0, 0,0.6);
            border:2px solid white;
            transition:0.5s;
            font-weight:bold;
            font-size:15px;
            width:50px;
            border-radius:10%;
            }
       
        .btn2:hover{
            
            color:rgba(0, 0, 0,0.6);
            background-color:white;
            border:2px solid rgba(0, 0, 0,0.6);
        }
            #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(0, 0, 0,0.2);
      border-bottom:3px solid white;
    }
        .auto-style8 {
            font-weight: bold;
            text-align: right;
        }
        #TextArea1 {
            text-align: center;
        }
        #TextArea2 {
            text-align: left;
        }
        #TextArea3 {
            text-align: left;
        }
        #txt_describe_ar {
            text-align: center;
        }
        #txt_describ_en {
            text-align: center;
        }
        .auto-style11 {
            text-align: center;
            color: #FFFFFF;
            font-size: large;
            width: 124px;
        }
        .auto-style12 {
            position:relative;
            margin-left:auto;
            margin-right:auto;
            margin-top: 90px;
            width: 317px;
            background-color: rgba(0, 0, 0,0.2);
            border-radius: 10px;
            border: solid 2px white;
             
        }
        hr{
            
            width:250px;
            position:relative;
            margin-left:auto;
            margin-right:auto
        }
        .auto-style13 {
            color: #FFFFFF;
        }
        .auto-style15 {
            text-align: center;
            height: 29px;
            color: #FFFFFF;
            font-size: large;
        }
        .marg{
margin:0px;
            padding:0px;
        }
       
    
    #new {
        list-style: none;
        display: none;
        margin: 0px;
        position: relative;
        right: 62px;
        bottom:40px;
    }

        #new li {
            transition: 0.5s;
            margin: 0px;
        }

    .btn1 {
        color: white;
        margin: 10px;
        background-color: rgba(0, 0, 0,0.6);
        border: 2px solid white;
        transition: 0.5s;
        font-weight: bold;
        font-size: 15px;
        border-radius: 15px;
        width: 70px;
        height: 30px;
        margin: 20px 40px;
        text-align: center;
        line-height: 30px;
    }

        #new li a {
        text-decoration: none;
        color: white
    }

        #new{
        list-style: none;
        display: none;
        margin: 0px;
        position: relative;
        right: 62px;
        bottom:40px;
    }

        .auto-style16 {
            text-align: center;
            color: #FFFFFF;
            font-size: large;
        }
        .auto-style3 {
            width: 100px;
        }
        .auto-style4 {
            width: 197px;
        }
        
        </style>
    <script>
        function change() {
            let colorinput = document.getElementById("color").value;
            document.getElementById('theColor').value = colorinput;
        }



    </script>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>

    <body>
    <form id="form1" runat="server">
        <div id="header" class="auto-style1">
            <br />
            <asp:ImageButton ID="ImageButton1" Style="outline: none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
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
        
        <table align="center" class="auto-style12" dir="rtl">
            <tr>
                <td class="auto-style11">
                    اسم العميل</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txt_Govern" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            
           
            <tr>
                <td class="auto-style15 marg" colspan="2">
                    <hr />
                </td>
            </tr>
            
           
            <tr>
                <td class="auto-style11">
                    نوع العميل</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txt_location" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
                </tr>
           
           
           
            <tr>
                <td class="auto-style16" colspan="2">
                     
                                 <asp:Label ID="lbl_category" runat="server" ></asp:Label>
                             
                                 <input type="color" id="color"  onchange="change()"/></td>
                        
                                 <asp:HiddenField ID="theColor" runat="server"></asp:HiddenField> <%--<asp:Label ID="theColor" runat="server" ></asp:Label>--%>
                            
                 </td>
                </tr>
           
           
           
            <tr>
                <td colspan="2" class="auto-style1">
                    <asp:Label ID="lbl_message" runat="server" CssClass="auto-style13"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style1">
                    <hr />
                    <strong>
                    <asp:Button ID="Button1" runat="server" CssClass="btn2" Text="رجوع"  Height="37px" OnClick="Button1_Click" />
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;
                    <strong>
                    <asp:Button ID="Button2" runat="server" CssClass="btn2" Text="اضافة" OnClick="Button2_Click" Height="37px" Width="63px" />
                    </strong></td>
            </tr>
        </table>

    </form>
    </body>
</html>