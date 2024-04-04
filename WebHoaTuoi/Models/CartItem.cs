﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebHoaTuoi.Models
{
    public class CartItem
    {
        public int MaSP { set; get; }
        public string TenSP { set; get; }
        public string Hinh { set; get; }
        public int DonGia { set; get; }
        public int SoLuong { set; get; }
        public int ThanhTien
        {
            get { return SoLuong * DonGia; }
        }

    }
}