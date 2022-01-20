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

    protected void grid_edit_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_edit.EditIndex = e.NewEditIndex;
        fill("");

    }

    protected void grid_edit_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {


    }

    protected void grid_edit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_edit.EditIndex = -1;
        fill("");
    }




    protected void grid_edit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grid_edit.PageIndex = e.NewPageIndex;
        fill("");
    }

    protected void txt_search_TextChanged(object sender, EventArgs e)
    {
        fill("and( worker like N'%"+txt_search.Text.ToString()+"%' or cuase like N'%"+txt_search.Text.ToString()+"%' or pieces like N'%"+txt_search.Text.ToString()+"%') order by date desc");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {string y="";
        if (txt_search.Text.ToString() != "") {
            y="and( worker like N'%"+txt_search.Text.ToString()+"%' or cuase like N'%"+txt_search.Text.ToString()+"%' or pieces like N'%"+txt_search.Text.ToString()+"%') order by date desc";
      }
            SqlCommand cmd = new SqlCommand("select count(*) from maint where id=id "+y, con);
            con.Open();
            int num = Int32.Parse(cmd.ExecuteScalar().ToString());
            con.Close();
            grid_edit.PageSize = num;
            fill(y);
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
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <style>
        #grid_edit{
             position:relative;
            margin-left:auto;
            margin-right:auto;
            z-index: -1;
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
        .auto-style3 {
            color: #FFFFFF;
            left: 0px;
            top: 0px;
            width: 908px;
            height: 159px;
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
        <li><a href="report2.aspx">طباعة تقرير<i class="fas fa-print"></i></a></li>
    </ul>
</div>
        <p class="auto-style1">
            <asp:Button ID="Button1" runat="server" Text="طباعة تقرير" OnClick="Button1_Click" />
            <asp:TextBox ID="txt_search" placeholder="بحــث" style="text-align:center;direction:rtl" runat="server" OnTextChanged="txt_search_TextChanged" AutoPostBack="True"></asp:TextBox>
        </p>
        
      
        
                    <div class="auto-style1">
        
      
        
                    <asp:GridView  GridLines="Both" RowStyle-BorderWidth="2" ID="grid_edit" runat="server"  AutoGenerateColumns="False" CssClass="auto-style3" AllowPaging="True" OnPageIndexChanging="grid_edit_PageIndexChanging" PageSize="15" CellPadding="4" ForeColor="#333333"  >
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
