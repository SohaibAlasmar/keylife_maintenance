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
        int id =Int32.Parse( Request.QueryString["id"]);
            lbl_id.Text = id.ToString();
        string sql = "insert into maint values ('"+id+"','"+Convert.ToDateTime(txt_date.Text.ToString())+"',N'"+txt_worker.Text.ToString()+"',N'"+txt_cz.InnerText.ToString()+"',N'"+txt_change_piece.InnerHtml+"',(select warranty_expire from info where id="+id+"));";
        SqlCommand cmd = new SqlCommand(sql,con);
        con.Open();
       cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("add_maint.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("add_maint.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
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
                
               

            }
            con.Close();
        }
         if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
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
                <td class="auto-style8">رقم العميل</td>
                <td class="auto-style12">
                    <asp:TextBox style="background-color:white;text-align:center" ReadOnly="True" Width="150px" ID="lbl_id" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">العميل</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txt_client" class="Text" runat="server" Width="150px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">عامل الصيانة</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txt_worker" runat="server" Width="150px" style="text-align: center"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">وقت الصيانة</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txt_date" runat="server" Width="150px" style="text-align: center" TextMode="DateTimeLocal"></asp:TextBox>
                </td>
            </tr>
            
           
            <tr>
                <td class="auto-style8" >سبب الصيانة</td>
                <td class="auto-style12">
                   <textarea runat="server" style="width:150px;text-align:center" rows="3" id="txt_cz"></textarea></td>
            </tr>
            
           
            <tr>
                <td class="auto-style8" >قطع الغيار</td>
                <td class="auto-style12">
                    <textarea id="txt_change_piece" runat="server" cols="20" name="S1" rows="3" style="width:150px;text-align:center"></textarea></td>
            </tr>
            <tr>
                
                <td colspan="2" class="auto-style1">
                    <asp:Label ID="lbl_message" runat="server" CssClass="auto-style20"></asp:Label>
                </td>
            </tr>
            <tr>
                
                <td class="auto-style1">
                    <asp:Button ID="Button2" runat="server" CssClass="btn" Text="اضافة" OnClick="Button2_Click"  />
                    
                    
                  </td>
                <td>
                    
                    
                    <asp:Button ID="Button1" runat="server" CssClass="btn" Text="عودة"   OnClick="Button1_Click" />
                  </td>
            </tr>
        </table>
    
    </form>
    </body>
</html>
