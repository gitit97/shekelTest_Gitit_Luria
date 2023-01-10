using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace shekelTest_Gitit_Luria.Models
{
    public class ReturnData
    {

       
        public int groupCode { get; set; }
        public string groupName { get; set; }
        public List<string> customersIDsList { get; set; }
    }
}