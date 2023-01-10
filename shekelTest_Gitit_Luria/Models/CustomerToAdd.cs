using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shekelTest_Gitit_Luria.Models
{
    public class CustomerToAdd
    {
        public string customerId { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string phone { get; set; }
        public int groupCode { get; set; }
        public int factoryCode { get; set; }

    }
}