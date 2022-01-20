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
        string sql = "select * from info "+y;
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
    {  yes();
        no();
        month();
        if (!Page.IsPostBack) {
                  
 fill("order by date desc");
}


        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void yes()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select id  from info where getdate() <Warranty_expire_date", con);
        SqlDataReader r;

        r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            while (r.Read())
            {

                SqlCommand cmd1=new SqlCommand("update info set warranty_expire=(select color from client where client_name=info.client) where id=" + r["id"].ToString()+";",con);

                cmd1.ExecuteNonQuery();
            }
            con.Close();
        }


        con.Close();
    }
    protected void no()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select id  from info where getdate() >=Warranty_expire_date", con);
        SqlDataReader r;

        r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            while (r.Read())
            {

                SqlCommand cmd1=new SqlCommand("update info set warranty_expire='red' where id=" + r["id"].ToString()+";",con);

                cmd1.ExecuteNonQuery();
            }
            con.Close();
        }


        con.Close();
    }
    protected void month()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT id from info ", con);

        SqlDataReader r;

        r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            while (r.Read())
            {

                SqlCommand cmd1=new SqlCommand("update info set warranty_expire='darkorange' where id=" + r["id"].ToString()+" and DATEADD(month, -1, Warranty_expire_date)<=getdate() and DATEADD(month, 1, Warranty_expire_date)>=getdate()",con);

                cmd1.ExecuteNonQuery();
            }
            con.Close();
        }


        con.Close();
    }
    protected void grid_edit_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_edit.EditIndex = e.NewEditIndex;
        fill("order by date desc");

    }

    protected void grid_edit_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {


    }

    protected void grid_edit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_edit.EditIndex = -1;
        fill("order by date desc");
    }




    protected void grid_edit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_edit.PageIndex = e.NewPageIndex;
        fill("order by date desc");
    }



    protected void Button1_Click(object sender, EventArgs e)
    {string y="";
       
        SqlCommand cmd = new SqlCommand("select count(*) from info "+y, con);
        con.Open();
        int num = Int32.Parse(cmd.ExecuteScalar().ToString());
        con.Close();
        grid_edit.PageSize = num;

        if (chk_Expired.Checked)
        {
            y = "where warranty_expire='red' order by date desc";
        }
        if (chk_not.Checked)
        {
            y = "where warranty_expire!='red' and warranty_expire!='darkorange' order by date desc";
        }
        if (chk_expiredsoon.Checked)
        {
            y = "where warranty_expire='darkorange' order by date desc";
        }
        if(chk_Expired.Checked && chk_expiredsoon.Checked)
        {
            y="where warranty_expire='red' or warranty_expire='darkorange'  order by date desc";
        }
        if(chk_Expired.Checked && chk_not.Checked)
        {
            y="where warranty_expire!='darkorange' order by date desc";
        }
        if(chk_expiredsoon.Checked && chk_not.Checked)
        {
            y="where warranty_expire!='red' order by date desc";
        }
        fill(y);
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
        SqlCommand cmd2 = new SqlCommand("select color from client where client_name=N'" + DataBinder.Eval(e.Row.DataItem, "client") + "'", con);
        SqlDataReader r1;

        r1 = cmd2.ExecuteReader();
        if (r1.HasRows)
        {
            while (r1.Read())
            {
                e.Row.Attributes.CssStyle.Value = "background-color:" + HexToColor(r1["color"].ToString());

            }
            con.Close();
        }


        con.Close();

        con.Open();
        SqlCommand cmd = new SqlCommand("select warranty_expire from info where (warranty_expire='red' or warranty_expire='darkorange') and id='" + DataBinder.Eval(e.Row.DataItem, "id") + "'", con);
        SqlDataReader r;

        r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            while (r.Read())
            {
                e.Row.Attributes.CssStyle.Value = "color:white;background-color:" + r["warranty_expire"].ToString();

            }
            con.Close();
        }


        con.Close();


    }

    protected void chk_all_CheckedChanged(object sender, EventArgs e)
    {
        fill("order by date desc");
        chk_Expired.Checked = false;
        chk_expiredsoon.Checked = false;
        chk_not.Checked = false;

    }

    protected void chk_Expired_CheckedChanged(object sender, EventArgs e)
    {
        fill("where warranty_expire='red' order by date desc");

        chk_all.Checked = false;
        if(chk_Expired.Checked && chk_expiredsoon.Checked)
        {
            fill("where warranty_expire='red' or warranty_expire='darkorange'  order by date desc");
        }
        if(chk_Expired.Checked && chk_expiredsoon.Checked && chk_not.Checked)
        {
            chk_Expired.Checked = false;
            chk_expiredsoon.Checked = false;
            chk_not.Checked = false;
            chk_all.Checked=true;
            fill("order by date desc");
        }
        if(chk_Expired.Checked && chk_not.Checked)
        {
            fill("where warranty_expire!='darkorange' order by date desc");
        }
        if(chk_expiredsoon.Checked && chk_not.Checked)
        {
            fill("where warranty_expire!='red' order by date desc");
        }
    }

    protected void chk_expiredsoon_CheckedChanged(object sender, EventArgs e)
    {
        fill("where warranty_expire='darkorange' order by date desc");
        chk_all.Checked = false;

        if(chk_Expired.Checked && chk_expiredsoon.Checked)
        {
            fill("where warranty_expire='red' or warranty_expire='darkorange'  order by date desc");
        }
        if(chk_Expired.Checked && chk_not.Checked)
        {
            fill("where warranty_expire!='darkorange' order by date desc");
        }
        if(chk_expiredsoon.Checked && chk_not.Checked)
        {
            fill("where warranty_expire!='red' order by date desc");
        }
        if(chk_Expired.Checked && chk_expiredsoon.Checked && chk_not.Checked)
        {
            chk_Expired.Checked = false;
            chk_expiredsoon.Checked = false;
            chk_not.Checked = false;
            chk_all.Checked=true;
            fill("order by date desc");
        }
    }

    protected void chk_not_CheckedChanged(object sender, EventArgs e)
    {
        fill("where warranty_expire!='red' and warranty_expire!='darkorange' order by date desc");

        chk_all.Checked = false;
        if(chk_Expired.Checked && chk_expiredsoon.Checked && chk_not.Checked)
        {
            chk_Expired.Checked = false;
            chk_expiredsoon.Checked = false;
            chk_not.Checked = false;
            chk_all.Checked=true;
            fill("order by date desc");
        }
        if(chk_Expired.Checked && chk_not.Checked)
        {
            fill("where warranty_expire!='darkorange' order by date desc");
        }
        if(chk_expiredsoon.Checked && chk_not.Checked)
        {
            fill("where warranty_expire!='red' order by date desc");
        }
    }

    protected void grid_edit_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txt_fill()
    {
        if (txt3.Text.ToString() != "") {
            fill("where  location like N'%" + txt3.Text.ToString() + "%'" +
                " order by date desc ");
        }if (txt2.Text.ToString() != "")
        {
            fill("where  Governorate like N'%" + txt2.Text.ToString() + "%' order by date desc ");
        }  if (txt1.Text.ToString() != "")
        {
            fill("where client like N'%" + txt1.Text.ToString() + "%' order by date desc ");
        }

        if(txt1.Text.ToString() !="" && txt2.Text.ToString() != "")
        {
            fill("where client like N'%"+txt1.Text.ToString()+"%' and Governorate like N'%"+txt2.Text.ToString()+"%' order by date desc ");
        }
        if(txt1.Text.ToString() !="" && txt3.Text.ToString() != "")
        {
            fill("where client like N'%"+txt1.Text.ToString()+"%'  and location like N'%"+txt3.Text.ToString()+"%'"+
             " order by date desc ");
        }
        if(txt2.Text.ToString() !="" && txt3.Text.ToString() != "")
        {
            fill("where  Governorate like N'%"+txt2.Text.ToString()+"%' and location like N'%"+txt3.Text.ToString()+"%'"+
             " order by date desc ");
        }
        if(txt1.Text.ToString() !="" && txt3.Text.ToString() != "" && txt2.Text.ToString() != "")
        {
            fill("where client like N'%"+txt1.Text.ToString()+"%' and Governorate like N'%"+txt2.Text.ToString()+"%' and location like N'%"+txt3.Text.ToString()+"%'"+
              " order by date desc ");
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
        <p class="auto-style1">
            <asp:CheckBox ID="chk_all" runat="server" Text="All" OnCheckedChanged="chk_all_CheckedChanged" AutoPostBack="True" />&nbsp;<asp:CheckBox ID="chk_Expired" runat="server" Text="Expired" OnCheckedChanged="chk_Expired_CheckedChanged" AutoPostBack="True" />&nbsp;<asp:CheckBox ID="chk_expiredsoon" runat="server" Text="Expired soon" AutoPostBack="True" OnCheckedChanged="chk_expiredsoon_CheckedChanged" />&nbsp;<asp:CheckBox ID="chk_not" runat="server" Text="Non expired" AutoPostBack="True" OnCheckedChanged="chk_not_CheckedChanged" /></p>
                           <div class="auto-style1">
       
                    <asp:GridView RowStyle-BorderWidth="2" ID="grid_edit" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" AllowPaging="True" OnPageIndexChanging="grid_edit_PageIndexChanging" PageSize="15" CellPadding="4" ForeColor="#333333"  OnRowDataBound="grid_edit_RowDataBound" OnSelectedIndexChanged="grid_edit_SelectedIndexChanged" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" ReadOnly="True" />
                            <asp:BoundField DataField="client" ItemStyle-Width="90" HeaderText="اسم العميل" />
                            <asp:BoundField DataField="Governorate" ItemStyle-Width="90" HeaderText="المحافظة" />
                            <asp:BoundField DataField="location" ItemStyle-Width="90" HeaderText="الفرع" />
                            <asp:BoundField DataField="date" HeaderText="تاريخ التركيب" DataFormatString="{0:yyyy/MM/dd}" />
                            <asp:BoundField DataField="Warranty_expire_date" HeaderText="انتهاء الكفالة" DataFormatString="{0:yyyy/MM/dd}" />
                            <asp:BoundField DataField="phone" HeaderText="رقم التواصل" />
                            <asp:BoundField DataField="ScrNum" HeaderText="عدد الشاشات الفرعية" />
                            <asp:BoundField DataField="hangsTall" HeaderText="طول العلاقات" />
                            <asp:BoundField DataField="LCDnum" HeaderText="عدد شاشات LCD" />
                            <asp:BoundField DataField="oprCircle" HeaderText="دائرة تشغيل" />
                            <asp:BoundField DataField="Motherborder" HeaderText="نوع Mother board" />
                            <asp:BoundField DataField="printer_type" HeaderText="نوع الطابعة" />
                            <asp:BoundField DataField="pwrSuplly" HeaderText="مواصفة Power supply" />
                            <asp:BoundField DataField="headset_num" HeaderText="عدد السماعات" />
                            <asp:BoundField DataField="Amplifire" HeaderText="نوع Amplifire" />
                            <asp:BoundField DataField="headset_loc" HeaderText="مكان تعليق السماعات" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55"  ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55"  ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" ForeColor="White"/>
                        <SelectedRowStyle BackColor="#C5BBAF"  ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
               
        </div>
               
        </form>
</body>
</html>
