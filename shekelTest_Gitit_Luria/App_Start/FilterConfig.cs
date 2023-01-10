using System.Web;
using System.Web.Mvc;

namespace shekelTest_Gitit_Luria
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
