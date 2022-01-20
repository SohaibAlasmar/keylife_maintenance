<%@ Page Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>

<script runat="server">
    SqlConnection con = new SqlConnection("");

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("main.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string b = "";
        if (CheckBox1.Checked)
        {
            b = "yes";
        }
        else
            b = "no";
        DateTime time = Convert.ToDateTime(txt_date.Text.ToString());
        DateTime war = Convert.ToDateTime(txt_warnty.Text.ToString());
        string sql = "update info set client=N'"+txt_client.Text.ToString()+"',Governorate=N'"+txt_Governorate.Text.ToString()+"',location=N'"+txt_loc.Text.ToString()+
        "',date=N'"+time+"',Warranty_expire_date=N'"+war+"',phone=N'"+ txt_phone.Text.ToString()+"',ScrNum=N'"+txt_ScrNum.Text.ToString()+"',hangsTall=N'"+txt_hangsTall.Text.ToString()+
        "',LCDnum=N'"+txt_LCDnum.Text.ToString()+"',oprCircle=N'"+b.ToString()+"',Motherborder=N'"+txt_MthrB.Text.ToString()+
        "',printer_type=N'"+txt_printer_type.Text.ToString()+"',pwrSuplly=N'"+txt_pwrSply.Text.ToString()+"',headset_num=N'"+txt_headset_num.Text.ToString()+
        "',Amplifire=N'"+txt_Amplifire.Text.ToString()+"',headset_loc=N'"+txt_headset_loc.Text.ToString()+"' where id='"+lbl_id.Text.ToString()+"';";
        SqlCommand cmd = new SqlCommand(sql,con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("add_edit.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("add_edit.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!Page.IsPostBack)
        {
            string id = Request.QueryString["id"];
            lbl_id.Text = id;
            SqlCommand cmd = new SqlCommand("select * from info where id=" + id, con);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                txt_client.Text = dr["client"].ToString();
                txt_Governorate.Text = dr["Governorate"].ToString();
                txt_loc.Text = dr["location"].ToString();
                txt_date.Text = dr["date"].ToString();
                txt_warnty.Text = dr["Warranty_expire_date"].ToString();
                txt_phone.Text = dr["phone"].ToString();
                txt_ScrNum.Text = dr["ScrNum"].ToString();
                txt_hangsTall.Text = dr["hangsTall"].ToString();
                txt_LCDnum.Text = dr["LCDnum"].ToString();
                if (dr["oprCircle"].ToString() == "yes") {
                    CheckBox1.Checked =true ;
                }
               
                txt_MthrB.Text = dr["Motherborder"].ToString();
                txt_printer_type.Text = dr["printer_type"].ToString();
                txt_pwrSply.Text = dr["pwrSuplly"].ToString();
                txt_headset_num.Text = dr["headset_num"].ToString();
                txt_Amplifire.Text = dr["Amplifire"].ToString();
                txt_headset_loc.Text = dr["headset_loc"].ToString();
                txt_Governorate.Text = dr["Governorate"].ToString();

            }
            con.Close();
        }
        
    }
</script>
<style>
     body{
            margin:0px;
            width:100%;
            padding:0px;
        }
         html{
             background:url(images/back.jpg) no-repeat center center fixed;
          background-size:100% 100%;
              
        }
               #header{
      margin-top:0px;
      padding:0px;
      height:140px;
      width:100%;
      background-color:rgba(0, 0, 0,0.2);
      border-bottom:3px solid white;
    }
    .auto-style1 {
        text-align: center;
    }
        .table {
            margin-top:90px;
            width: 300px;
            background-color:rgba(48, 122, 121,0.15);
            border-radius:5%;
            border:solid 2px white;
        }
        .auto-style9 {
            text-align: right;
            height: 29px;
        }
        #txt_describe_ar {
            text-align: center;
        }
        #txt_describ_en {
            text-align: center;
        }
        #TextArea1 {
            text-align: center;
        }
        .auto-style6 {
        height: 23px;
        text-align: right;
    }
        hr{
            border:1px solid white;
            
        }
        .table {
            margin-top:90px;
            width: 300px;
            background-color:rgba(48, 122, 121,0.15);
            border-radius:5%;
            border:solid 2px white;
        }
        hr{
            border:1px solid white;
            
        }
        table td{
        }
        .btn {
        color: white;
        margin: 10px;
        background-color: rgba(0, 0, 0,0.6);
        border: 2px solid white;
        transition: 0.5s;
        font-weight: bold;
        font-size: 15px;
        border-radius: 15px;
        width:90px;
        height: 40px;
        margin: 20px 40px;
        text-align: center;
    }

        .btn:hover {
            color: rgba(0, 0, 0,0.6);
            background-color: white;
            border: 2px solid rgba(0, 0, 0,0.6);
        }
        .auto-style12 {
        text-align: right;
    }
        .auto-style14 {
        height: 23px;
        text-align: right;
        width: 120px;
        color: #FFFFFF;
    }
        .auto-style8 {
        font-weight: bold;
        text-align: right;
        color: #FFFFFF;
        width: 120px;
    }
        .auto-style7 {
        height: 23px;
        font-weight: bold;
        text-align: right;
        color: #FFFFFF;
        width: 120px;
    }
        .auto-style10 {
            font-weight: bold;
            text-align: right;
            height: 29px;
        color: #FFFFFF;
        width: 120px;
    }
        .auto-style18 {
        text-align: right;
        direction: ltr;
    }
        .auto-style19 {
        width: 318px;
        background-color:rgba(0, 0, 0,0.2);
            border-radius:5%;
            border:solid 2px white;
        margin-top: 90px;
    }
        .auto-style20 {
        color: #FFFFFF;
    }
        .Text{
            text-align:center
        }
        </style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div id="header" class="auto-style1">
              <br />
              <asp:ImageButton CssClass="img-responsive center-block" ID="ImageButton1" style="outline:none" runat="server" Height="96px" ImageUrl="~/images/logo2.png" Width="493px" OnClick="ImageButton1_Click" />
              </div>
    <p class="auto-style1">
        &nbsp;</p>
    
        <table align="center" class="auto-style19" dir="rtl">
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">رقم الاضافة</td>
                <td class="auto-style12">
                    <asp:Label style="background-color:white;text-align:center" Width="150px" ID="lbl_id" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">العميل</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_client" class="Text" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">المحافظة</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txt_Governorate" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">الموقع</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_loc" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            
           
            <tr>
                <td class="auto-style8" >تاريخ التركيب</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_date"  class="Text"  runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            
           
            <tr>
                <td class="auto-style8" >انتهاء الكفالة</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_warnty"  class="Text"  runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">رقم التواصل</td>
                
                <td class="auto-style12">
                    <asp:TextBox ID="txt_phone"   class="Text" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style8">عدد الشاشات الفرعية</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_ScrNum" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style8">طول العلاقات</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_hangsTall" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">عدد شاشات LCD</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_LCDnum" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style8">دائرة التشغيل</td>
                <td class="Text">
                                      <asp:CheckBox ID="CheckBox1" runat="server" />
                </td>
            </tr>
           
            <tr>
                <td class="auto-style8">نوع ال Mother board</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_MthrB" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
             <tr>

                <td class="auto-style8">نوع الطابعة</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txt_printer_type" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td id="least0" class="auto-style7">مواصفات ال Power supply</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_pwrSply"  class="Text" runat="server" Width="150px"></asp:TextBox>
                </td>

            </tr>
           
           
            <tr>
                <td class="auto-style14">
                    <strong>عدد السماعات</strong></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_headset_num" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">
                    <strong>نوع Amplifire</strong></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_Amplifire" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
           
           
            <tr>
                <td class="auto-style14">
                    <strong>مكان تعليق السماعات</strong></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_headset_loc" runat="server" Width="150px" style="text-align: center" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                
                <td colspan="2" class="auto-style1">
                    <asp:Label ID="lbl_message" runat="server" CssClass="auto-style20"></asp:Label>
                </td>
            </tr>
            <tr>
                
                <td class="auto-style1">
                    <asp:Button ID="Button2" runat="server" CssClass="btn" Text="تعديل" OnClick="Button2_Click"  />
                    
                    
                  </td>
                <td>
                    
                    
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="عودة"   OnClick="Button1_Click" />
                  </td>
            </tr>
        </table>
    
    </form>
    </body>
</html>
