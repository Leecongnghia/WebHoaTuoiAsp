using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
namespace WebHoaTuoi.Models
{
    public class Cart
    {
        //khai báo danh sách dùng để lưu trữ các sản phẩm (CartItem)
        private List<CartItem> _items;

        //Phương thức khởi tạo giỏ hàng
        public Cart()
        {
            _items = new List<CartItem>();
        }
        //phương thức trả về danh sách các sản phẩm trong giỏ
        public List<CartItem> Items { get { return _items; } }
        //phương thức thêm sản phẩm vào giỏ
        public void Add(int masp)
        {
            //truy xuất CSDL để lấy thông tin về sản phẩm cần thêm vào giỏ hàng
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["HoaTuoiASPConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Hoa where mahoa=@mahoa", conn);
            cmd.Parameters.AddWithValue("@mahoa", masp);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //tạo đối tượng CartItem
                CartItem sp = new CartItem
                {
                    MaSP = masp,

                    TenSP = dr["TenHoa"].ToString(),
                    Hinh = dr["hinh"].ToString(),
                    DonGia = int.Parse(dr["Gia"].ToString()),

                    SoLuong = 1
                };
                


                // cho trường hợp sản phẩm đã có trong giỏ)
                _items.Add(sp);
            }
        }
        //Phương thức cập nhật số lượng,
        public void Update(int masp, int soluong)
        {
            
        }
        //Phương thức xoá sản phẩm khỏi giỏ,
        public void Delete(int masp)
        {
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["HoaTuoiASPConnectionString"].ConnectionString);
            
            SqlCommand cmd = new SqlCommand("delete * from Hoa where mahoa=@mahoa", conn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@mahoa",System.Data.SqlDbType.Int).Value = Convert.ToInt32(masp);
            cmd.Connection = conn;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        //Tính tổng thành tiền
        public int Total
        {
            get
            {
                int tong = 0;
                foreach (CartItem item in _items)
                {
                    tong += item.ThanhTien;
                }
                return tong;
            }
        }
    }
}