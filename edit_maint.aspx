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


    protected void grid_edit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int j = Convert.ToInt32(e.RowIndex);
        GridViewRow row = grid_edit.Rows[j];
        SqlCommand cmd = new SqlCommand("delete from maint where id="+row.Cells[0].Text,con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        fill("");
    }

    protected void grid_edit_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        int j = Convert.ToInt32(e.RowIndex);
        GridViewRow row = grid_edit.Rows[j];
        String id = row.Cells[0].Text;
        string date = ((TextBox)grid_edit.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string worker = ((TextBox)grid_edit.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        string cuase = ((TextBox)grid_edit.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        string pieces = ((TextBox)grid_edit.Rows[e.RowIndex].Cells[5].Controls[0]).Text;


        string sql = "update maint set date=N'"+date+"',worker=N'"+worker+"',cuase=N'"+cuase+"',pieces=N'"+pieces+"' where id="+id+";";

        SqlCommand cmd = new SqlCommand(sql, con);
        con.Open();
        int t= cmd.ExecuteNonQuery();
        con.Close();
        if (t > 0)
        {
            grid_edit.EditIndex = -1;

            fill("");
        }
    }



    protected void grid_edit_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
    {
        grid_edit.EditIndex = -1;
        fill("");
    }

    protected void grid_edit_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        grid_edit.EditIndex = e.NewEditIndex;
        fill("");
    }

    protected void txt_search_TextChanged(object sender, EventArgs e)
    {
           fill("and( worker like N'%"+txt_search.Text.ToString()+"%' or cuase like N'%"+txt_search.Text.ToString()+"%' or pieces like N'%"+txt_search.Text.ToString()+"%') order by info.date desc");
    }
</script>
<link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        #grid_edit{
             
            width:80vw;
            margin-top:10px;
            z-index: -1;
            margin-left:10%;
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
          
        <p style="text-align:center">
            <asp:TextBox ID="txt_search" placeholder="بحــث" style="text-align:center;direction:rtl" runat="server" OnTextChanged="txt_search_TextChanged" AutoPostBack="True"></asp:TextBox>
        </p>
               
     
        
        <div class="auto-style1">
                    <asp:GridView ID="grid_edit" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" AllowPaging="True" OnPageIndexChanging="grid_edit_PageIndexChanging" OnRowDeleting="grid_edit_RowDeleting" OnRowUpdating="grid_edit_RowUpdating1"  OnRowCancelingEdit="grid_edit_RowCancelingEdit1" OnRowEditing="grid_edit_RowEditing1" PageSize="15" CellPadding="4" GridLines="Both" RowStyle-BorderWidth="2" ForeColor="#333333" >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" ReadOnly="True" />
                            <asp:BoundField DataField="client" HeaderText="اسم العميل" ReadOnly="True" />
                            <asp:BoundField DataField="date" HeaderText="وقت الصيانة" DataFormatString="{0:yyyy/dd/MM}" />
                            <asp:BoundField DataField="worker" HeaderText="عامل الصيانة" />
                            <asp:BoundField DataField="cuase" HeaderText="سبب الصيانة" />
                            <asp:BoundField DataField="pieces" HeaderText="قطع الغيار" />
                            <asp:CommandField ButtonType="Button" EditText="تعديل" ShowEditButton="True" UpdateText="حفظ" CancelText="الغاء" />
                            <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" OnClientClick="return confirm('هل انت متأكد من انك تريد الحذف؟')" CausesValidation="False" CommandName="Delete" Text="حذف" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
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
