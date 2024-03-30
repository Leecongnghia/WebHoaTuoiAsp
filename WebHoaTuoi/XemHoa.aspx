<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoiSize.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebHoaTuoi.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">

    <h4>Trang Xem Hoa</h4>

    <div class="form-inline">
        Chọn Danh Mục Loại: <asp:DropDownList ID="ddlLoai" runat="server" 
            DataSourceID="sdsLoai" DataTextField="TenLoai" AutoPostBack="True" CssClass="form-control"
            DataValueField="MaLoai"></asp:DropDownList>
    </div>

    <div class="row mt-2">
         <asp:Repeater ID="rptHoa" runat="server" DataSourceID="sdsHoa">
             <ItemTemplate>
                 <div class="col-md-3 text-center mb-2">
                     <a href="#">
                         <img alt="" src="hinh_san_pham/<%# Eval("hinh") %>" />
                     </a> <br />

                     <%# Eval("TenHoa") %> <br />
                     Giá bán: <%# Eval("gia","{0:#,##0} đồng") %> <br />
                     <asp:Button ID="btAddToCard" runat="server" Text="AddToCard" 
                         CssClass="btn btn-danger" />
                 </div>
             </ItemTemplate>
         </asp:Repeater>
        </div>



    <asp:SqlDataSource ID="sdsLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiASPConnectionString %>" 
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsHoa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiASPConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLoai" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
