<%@ Page Language="C#" AutoEventWireup="true"   %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<script runat="server">
    SqlConnection con = new SqlConnection("workstation id=keylife.mssql.somee.com;packet size=4096;user id=keylife_SQLLogin_1;pwd=8il9c3meyk;data source=keylife.mssql.somee.com;persist security info=False;initial catalog=keylife");
    //SqlConnection con = new SqlConnection("server=DESKTOP-4A34169;database=maintenance;integrated security=sspi");

    protected void Button2_Click(object sender, EventArgs e)
    {

        string gov=txt_Govern.Text.ToString();
        string loc=txt_location.Text.ToString();
        DateTime date = Convert.ToDateTime(txt_date.Text.ToString());
        DateTime war = Convert.ToDateTime(txt_waranty.Text.ToString());
        string phone = txt_phone.Text.ToString();
        string ScrNum =txt_scrNum.Text.ToString();
        string hangsTall=txt_hangNum.Text.ToString();
        string LCDnum=txt_LDCnum.Text.ToString();
        string oprCircle = "";
        if (CheckBox1.Checked)
        {
            oprCircle = "yes";
        }
        else
            oprCircle = "no";
        string Motherborder = txt_MBtype.Text.ToString();
        string printer_type=txt_Printertype.Text.ToString();
        string pwrSuplly=txt_powerSup.Text.ToString();
        string headset_num=txt_headsetNum.Text.ToString();
        string Amplifire=txt_Amplitype.Text.ToString();
        string headset_loc=txt_headsetLoc.Text.ToString();
        int id =Int32.Parse( Request.QueryString["id"]);
        string sql = "insert into info values("+id+",(select client_name from client where client_id ="+id+"),N'"+gov+"',N'"+loc+"','"+date+"','"+war+"',N'"+phone+"',N'"+ScrNum+"',N'"+hangsTall+"',N'"+LCDnum+"',N'"+oprCircle+"',N'"+Motherborder+"',N'"+printer_type+"',N'"+pwrSuplly+"',N'"+headset_num+"',N'"+Amplifire+"',N'"+headset_loc+"',null)";
        SqlCommand cmd=new SqlCommand(sql,con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

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
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
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
            width:50px;
            color:white;
            margin:10px;
            background-color:rgba(0, 0, 0,0.6);
            border:2px solid white;
            transition:0.5s;
            font-weight:bold;
            font-size:15px;
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
        .auto-style6 {
            height: 23px;
            text-align: center;
            color: #FFFFFF;
            font-size: large;
            width: 315px;
        }
        .auto-style7 {
            height: 23px;
            font-weight: bold;
            text-align: right;
        }
        .auto-style8 {
            font-weight: bold;
            text-align: right;
        }
        .auto-style9 {
            text-align: center;
            height: 29px;
            color: #FFFFFF;
            font-size: large;
            width: 315px;
        }
        .auto-style10 {
            font-weight: bold;
            text-align: right;
            height: 29px;
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
            width: 315px;
        }
        .auto-style12 {

            
            width:10px;
          
            border-radius: 10px;
            border: solid 2px white;
             
        }
        hr{
            
            width:250px;
            position:relative;
            margin-left:auto;
            margin-right:auto
        }
        .auto-style14 {
            margin-right: 0px;
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
        .auto-style16 {
            width: 900px;
            height: 665px;
            position:relative;
          
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

      
      
        .auto-style21 {
            text-align: center;
            color: #FFFFFF;
            font-size: large;
            width: 316px;
        }
        .sidebar {
       top:142px;
            
        }
        table{
            position:relative;
            margin-left:auto;
            margin-right:auto

        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div id="header" class="auto-style1">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
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
             <table align="center" class="auto-style16" dir="rtl">
                  <tr>
                      <td class="auto-style18">
    
        <table  align="center" style="  background-color: rgba(32, 55, 100, 0.5);" class="auto-style12" dir="rtl">
            <tr>
                <td class="auto-style11" style="border-left:1px white solid"  rowspan="9">
                    <span style="writing-mode: vertical-rl"> بيانات العميل</span></td>
                <td class="auto-style11">
                    المحافظة</td>
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
                    فرع</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txt_location" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
                </tr>
           
           
           
            <tr>
                <td class="auto-style15 marg" colspan="2">
                    <hr />
                </td>
            </tr>
           
           
            <tr>
                <td class="auto-style6">
                    التاريخ</td>
                <td id="least0" class="auto-style7">
                    <asp:TextBox ID="txt_date" runat="server" Width="150px" style="text-align: center" CssClass="auto-style14" TextMode="DateTimeLocal" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15 marg" colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    تاريخ انتهاء االكفالة</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txt_waranty" runat="server" Width="150px" style="text-align: center" TextMode="DateTimeLocal" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15 marg" colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    رقم التواصل</td>
                <td id="least1" class="auto-style7">
                    <asp:TextBox ID="txt_phone" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
            </table>
    
                      </td>

                      <td class="auto-style19">
                          
                          
                          <table align="center"  style="  background-color: rgba(128, 96, 0, 0.5);" class="auto-style12" dir="rtl">
                              <tr>
                                   <td class="auto-style21" style="border-left:1px white solid"  rowspan="9">
                    <span style="writing-mode: vertical-rl">بيان مواصفة الكبينة</span></td>
                                  <td class="auto-style6">دائرة التشغيل</td>
                                  <td id="least16" class="auto-style7">
                                      <asp:CheckBox ID="CheckBox1" runat="server" />
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style15 marg" colspan="2">
                                      <hr />
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style6">نوع ال mother board</td>
                                  <td id="least17" class="auto-style7">
                                      <asp:TextBox ID="txt_MBtype" runat="server" style="text-align: center" Width="150px"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style15 marg" colspan="2">
                                      <hr />
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style6">نوع الطابعة </td>
                                  <td id="least18" class="auto-style7">
                                      <asp:TextBox ID="txt_Printertype" runat="server" style="text-align: center" Width="150px"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style15 marg" colspan="2">
                                      <hr />
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style6">مواصفات ال<br />
                                      Power supply</td>
                                  <td id="least19" class="auto-style7">
                                      <asp:TextBox ID="txt_powerSup" pattern="24V"  runat="server" style="text-align: center" value="24V" Width="150px"></asp:TextBox>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style22">
                         
                          
                          <table  align="center" style="  background-color: rgba(55, 86, 35,0.5);" class="auto-style12" dir="rtl">
            <tr>
                 <td class="auto-style11" style="border-left:1px white solid"  rowspan="9">
                    <span style="writing-mode: vertical-rl"> بيان مواصفة الشاشات</span></td>
                <td class="auto-style6">
                    عدد الشاشات<br />
                    الفرعية</td>
                <td id="least2" class="auto-style7">
                    <asp:TextBox ID="txt_scrNum" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15 marg" colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    طول العلاقات</td>
                <td id="least3" class="auto-style7">
                    <asp:TextBox ID="txt_hangNum" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style15 marg" colspan="2">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    عدد شاشات
                    <br />
                    LCD</td>
                <td id="least4" class="auto-style7">
                    <asp:TextBox ID="txt_LDCnum" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
            </table>
                      </td>
                      <td class="auto-style20">
                          <table align="center"  style="  background-color: rgba(128, 128, 128, 0.5);" class="auto-style12" dir="rtl">
                              <tr>
                                   <td class="auto-style11" style="border-left:1px white solid"  rowspan="9">
                    <span style="writing-mode: vertical-rl"> بيان نظام الصوت    </span></td>
                                  <td class="auto-style6">عدد السماعات</td>
                                  <td id="least32" class="auto-style7">
                                      <asp:TextBox ID="txt_headsetNum" runat="server" style="text-align: center" Width="150px"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style15 marg" colspan="2">
                                      <hr />
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style6">نوع Amplifire</td>
                                  <td id="least33" class="auto-style7">
                                      <asp:TextBox ID="txt_Amplitype" runat="server" style="text-align: center" Width="150px"></asp:TextBox>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style15 marg" colspan="2">
                                      <hr />
                                  </td>
                              </tr>
                              <tr>
                                  <td class="auto-style6">مكان تعليق السماعة</td>
                                  <td id="least34" class="auto-style7">
                                      <asp:TextBox ID="txt_headsetLoc" runat="server" style="text-align: center" Width="150px"></asp:TextBox>
                                  </td>
                              </tr>
                          </table>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2"><strong>&nbsp;&nbsp;
                          <asp:Button ID="Button1" runat="server" CssClass="btn2" Height="37px" OnClick="Button1_Click" Text="رجوع" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Button ID="Button2" runat="server" CssClass="btn2" Height="37px" OnClick="Button2_Click" Text="اضافة" Width="63px" />
                          </strong></td>
                  </tr>
              </table>
              </div>
    <div class="auto-style1">
    
    </div>
    </form>
</body>
</html>
