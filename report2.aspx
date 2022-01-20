<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
    
    
<!DOCTYPE html>

<script runat="server">
    SqlConnection con = new SqlConnection("");
    

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("main.aspx");
    }
    void fill(string y)
    {
        string sql = "select * from maint,info where info.id=info_id "+y;
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_edit.DataSource = dt;
        grid_edit.DataBind();
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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            fill("order by info.date desc");
        }



        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }





    protected void grid_edit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_edit.PageIndex = e.NewPageIndex;
        fill("order by info.date desc");
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        grid_edit.PageSize = 100000;



        if (txt1.Text.ToString() !="" || txt3.Text.ToString() != "" || txt2.Text.ToString() != "") {

            txt_fill();
        }
        grid_edit.Visible = true;
        Response.ClearContent();
        Response.AppendHeader("content-disposition", string.Format("attachment;filename=datacopy.xls"));
        Response.ContentType = "application/excel";

        StringWriter stringwriter = new StringWriter();
        HtmlTextWriter htmlwriter = new HtmlTextWriter(stringwriter);
        grid_edit.RenderControl(htmlwriter);
        Response.Write(stringwriter.ToString());
        Response.End();

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }

    protected void grid_edit_RowDataBound(object sender, GridViewRowEventArgs e)
    {



        con.Open();
        SqlCommand cmd = new SqlCommand("select warr from maint where (warr='red') and id='" + DataBinder.Eval(e.Row.DataItem, "id") + "'", con);
        SqlDataReader r;

        r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            while (r.Read())
            {
                e.Row.Attributes.CssStyle.Value = "color:white;background-color:" + r["warr"].ToString();

            }
            con.Close();
        }


        con.Close();


    }





    protected void grid_edit_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txt_fill()
    {
        if (txt3.Text.ToString() != "") {
            fill("and  location like N'%" + txt3.Text.ToString() + "%'" +
                " order by info.date desc ");
        }if (txt2.Text.ToString() != "")
        {
            fill("and  Governorate like N'%" + txt2.Text.ToString() + "%' order by info.date desc ");
        }  if (txt1.Text.ToString() != "")
        {
            fill("and client like N'%" + txt1.Text.ToString() + "%' order by info.date desc ");
        }

        if(txt1.Text.ToString() !="" && txt2.Text.ToString() != "")
        {
            fill("and client like N'%"+txt1.Text.ToString()+"%' and Governorate like N'%"+txt2.Text.ToString()+"%' order by info.date desc ");
        }
        if(txt1.Text.ToString() !="" && txt3.Text.ToString() != "")
        {
            fill("and client like N'%"+txt1.Text.ToString()+"%'  and location like N'%"+txt3.Text.ToString()+"%'"+
             " order by info.date desc ");
        }
        if(txt2.Text.ToString() !="" && txt3.Text.ToString() != "")
        {
            fill("and  Governorate like N'%"+txt2.Text.ToString()+"%' and location like N'%"+txt3.Text.ToString()+"%'"+
             " order by info.date desc ");
        }
        if(txt1.Text.ToString() !="" && txt3.Text.ToString() != "" && txt2.Text.ToString() != "")
        {
            fill("and client like N'%"+txt1.Text.ToString()+"%' and Governorate like N'%"+txt2.Text.ToString()+"%' and location like N'%"+txt3.Text.ToString()+"%'"+
              " order by info.date desc ");
        }
    }
    protected void txt1_TextChanged(object sender, EventArgs e)
    {

        txt_fill();
    }

    protected void txt2_TextChanged(object sender, EventArgs e)
    {
        txt_fill();
    }

    protected void txt3_TextChanged(object sender, EventArgs e)
    {
        txt_fill();
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <title></title>

    <style>
        #grid_edit{
            background-color: rgba(0, 0, 0,0.5);
              position:relative;
            margin-left:auto;
            margin-right:auto;
            width:80vw;
            z-index: -1;
            color:white;
            margin-top:10px;
        }
    body {
        margin: 0px;
        width: 100%;
        padding: 0px;
    }

    html {
        background: url(images/back.jpg) no-repeat center center fixed;
        background-size: 100% 100%;
    }

    #header {
        margin-top: 0px;
        padding: 0px;
        height: 140px;
        width: 100%;
        background-color: rgba(0, 0, 0,0.2);
        border-bottom: 3px solid white;
    }

    .auto-style1 {
        text-align: center;
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
        #chk_not,#chk_expiredsoon,#chk_Expired,#chk_all{
             margin:20px
        }
      #txt1,#txt2,#txt3{
          margin:20px;
          text-align:center
      }
       
                  </style>
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
        <li><a href="edit_maint.aspx">طباعة تقرير<i class="fas fa-print"></i></a></li>
    </ul>
</div>
        <p class="auto-style1">
            <asp:Button ID="Button1" runat="server" Text="طباعة تقرير" OnClick="Button1_Click" />
            <asp:TextBox ID="txt1" placeholder="اسم العميل" runat="server" OnTextChanged="txt1_TextChanged" AutoPostBack="True"></asp:TextBox>
            <asp:TextBox ID="txt2" placeholder="المحافظة" runat="server" CssClass="auto-style2" OnTextChanged="txt2_TextChanged" AutoPostBack="True"></asp:TextBox>
            <asp:TextBox ID="txt3" placeholder="الفرع" runat="server" OnTextChanged="txt3_TextChanged" AutoPostBack="True"></asp:TextBox>
        </p>
                           <div class="auto-style1">
       
                    <asp:GridView RowStyle-BorderWidth="2" ID="grid_edit" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" AllowPaging="True" OnPageIndexChanging="grid_edit_PageIndexChanging" PageSize="15" CellPadding="4" ForeColor="#333333"  OnRowDataBound="grid_edit_RowDataBound" OnSelectedIndexChanged="grid_edit_SelectedIndexChanged" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" ReadOnly="True" />
                            <asp:BoundField DataField="client" HeaderText="اسم العميل" />
                            <asp:BoundField DataField="Governorate" HeaderText="المحافظة" />
                            <asp:BoundField DataField="location" HeaderText="الفرع" />
                            <asp:BoundField DataField="date" HeaderText="وقت الصيانة" DataFormatString="{0:yyyy/dd/MM}" />
                            <asp:BoundField DataField="worker" HeaderText="عامل الصيانة" />
                            <asp:BoundField DataField="cuase" HeaderText="سبب الصيانة" />
                            <asp:BoundField DataField="pieces" HeaderText="قطع الغيار" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
               
        </div>
               
        </form>
</body>
</html>
