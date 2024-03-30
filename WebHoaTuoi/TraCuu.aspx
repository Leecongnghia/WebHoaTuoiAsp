<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoiSize.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="WebHoaTuoi.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">

    <h4>Trang Tra Cứu</h4>

    <div class="form-inline mb-2 ">
        Giá bán từ: <asp:TextBox ID="txtGiaTu" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaTu" runat="server" ControlToValidate="txtGiaTu" 
            ErrorMessage="Chưa nhập giá từ (*)"  ForeColor="Red"></asp:RequiredFieldValidator>
        
    </div>
    <div class="form-inline mb-3 ">
        Giá đến: <asp:TextBox ID="txtGiaDen" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGiaDen" runat="server" ControlToValidate="txtGiaDen" 
            ErrorMessage="Chưa nhập giá đến (*)"  ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Dữ Liệu Không hợp lệ (*)" ForeColor="Red"
            ControlToValidate="txtGiaDen" ControlToCompare="txtGiaTu" Operator="GreaterThanEqual" Type="Double" ></asp:CompareValidator>
    </div>
    <div class="mb-3">
        <asp:Button ID="btTraCuu" runat="server" Text="Tìm Kiếm" CssClass="btn btn-danger" />
    </div>


    <asp:ValidationSummary ID="vsLoi" runat="server" ShowSummary="False" />
     <div class="row mt-2">
         <asp:Repeater ID="rptHoa" runat="server" DataSourceID="sdsHoaTheoGia">
             <ItemTemplate>
                 <div class="col-md-3 text-center mb-2">
                     <a href="#">
                         <img alt="" src="hinh_san_pham/<%# Eval("hinh") %>"  />
                     </a> <br />

                     <%# Eval("TenHoa") %> <br />
                     Giá bán: <%# Eval("gia","{0:#,##0} đồng") %> <br />
                     <asp:Button ID="btAddToCard" runat="server" Text="AddToCard" 
                         CssClass="btn btn-danger" />
                 </div>
             </ItemTemplate>
         </asp:Repeater>
        </div>


    <asp:SqlDataSource ID="sdsHoaTheoGia" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiASPConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
