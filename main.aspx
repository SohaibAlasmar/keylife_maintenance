<%@ Page Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html>
<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<script runat="server">
    SqlConnection con = new SqlConnection("");
 
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("add.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("new_system.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        fill();
         if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    void fill()
    {
        string sql = "select * from client ";
        SqlCommand cms = new SqlCommand(sql, con);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid.DataSource = dt;
        grid.DataBind();
    }

    protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "add")
        {
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid.Rows[j];
            Response.Redirect("add.aspx?id="+row.Cells[2].Text);

        }
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int j = Convert.ToInt32(e.RowIndex);
        GridViewRow row = grid.Rows[j];
        SqlCommand cmd = new SqlCommand("delete from client where client_id="+row.Cells[2].Text,con);
         con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        fill();
    }

    protected void grid_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
       
    }
</script>
<style>
    body {
        margin: 0px;
        width: 100%;
        padding: 0px;
    }

    html {
        background: url(images/back.jpg) no-repeat center center fixed;
        background-size:cover
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
     #grid{
            background-color: rgba(0, 0, 0,0.5);
            text-align: center;
         position:relative;
            margin-left:auto;
            margin-right:auto;
            font-size:20px;
            width:40vw
            
        }
    .auto-style6 {
        color: #FFFFFF;
       margin-right:auto;
       margin-left:auto;
       position:relative;
       top:100px;
        width: 285px;
        font-size: medium;
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
        <li class="sp">...</li>
        <li><a href="add_user.aspx">اضافة مستخدم<i class="fas fa-add"></i></a></li>
    </ul>
</div>
        
        
                    <div class="auto-style1">
        
        
                    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" CssClass="auto-style6" OnRowCommand="grid_RowCommand" OnRowDeleting="grid_RowDeleting" OnRowDeleted="grid_RowDeleted" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:ButtonField ButtonType="Button" Text="اضافة" CommandName="add" />
                            <asp:ButtonField ButtonType="Button" CommandName="delete" Text="حذف" />
                            <asp:BoundField DataField="client_id" />
                            <asp:BoundField DataField="client_name" HeaderText="اسم العميل" />
                            <asp:BoundField DataField="client_type" HeaderText="نوع العميل" />
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
