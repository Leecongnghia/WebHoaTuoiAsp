<%@ Page Title="" Language="C#" MasterPageFile="~/HoaTuoiSize.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="WebHoaTuoi.XemHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Noidung" runat="server">

    <h4>Trang Xem Hoa</h4>

    <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="sdsHoa">
            <ItemTemplate>
                <div class="col-md-3 text-center mb-2">
                    <a href="#">
                        <img alt="" src="hinh_san_pham/<%# Eval("hinh") %>" />
                    </a>
                    <br />

                    <%# Eval("TenHoa") %>
                    <h6 style="color: red">Giá bán: <%# Eval("gia","{0:#,##0} triệu") %></h6>
                    <asp:Button ID="btAddToCard" runat="server" Text="Thêm vào giỏ"
                        CommandArgument='<%# Eval("MaHoa") %>' CssClass="btn bg-warning" OnClick="btAddToCard_Click" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>



    <!--sql--->
    <asp:SqlDataSource ID="sdsHoa" runat="server"
        ConnectionString="<%$ ConnectionStrings:HoaTuoiASPConnectionString %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="MaLoai" QueryStringField="maloai" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
