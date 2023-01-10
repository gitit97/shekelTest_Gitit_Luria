using shekelTest_Gitit_Luria.Models;
using shekelTest_Gitit_Luria.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace shekelTest_Gitit_Luria.Controllers
{


    //[Route("api/[controller]")]
    public class CustomersController : ApiController
    {

        private LogicController logic = new LogicController();

        

        //Return ReturnData object that contains gropCode,groupName and list of customersIDs by groupCode.
        public ReturnData Get(int groupCode_)
        {
            using (shekelTestEntities dbContext = new shekelTestEntities())
            {
                int groupCode = -999;
                string groupName = "";
                List<string> customersIDsList = new List<string>();

                try
                {

                    groupCode = dbContext.Groups.FirstOrDefault(e => e.groupCode == groupCode_).groupCode;
                    groupName = dbContext.Groups.FirstOrDefault(e => e.groupCode == groupCode_).groupName;
                    customersIDsList = (from FactoriesToCustomers in dbContext.FactoriesToCustomers
                                                     where FactoriesToCustomers.groupCode == groupCode
                                                     select FactoriesToCustomers.customerId).ToList();
                 }
                catch
                {

                }

                ReturnData returnData = new ReturnData
                {
                    groupCode = groupCode,
                    groupName = groupName,
                    customersIDsList = customersIDsList
                };

                return returnData;
            }
        }




        [HttpPost]
        [Route("newCustomer")]

        //Receiving an object and inserting it into a database using a function
        //AddCustomer from logicController.
        public HttpResponseMessage AddCustomer(CustomerToAdd CToA)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest,
                       ErrorsManager.GetErrors(ModelState));
                }

                Customer addedCustomer = logic.AddCustomer(CToA);
                return Request.CreateResponse(HttpStatusCode.Created, addedCustomer);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(
                    HttpStatusCode.InternalServerError,
                        ErrorsManager.GetInnerMessage(ex));
            }
        }



        //[HttpGet]
        //public IEnumerable<Customer> Get()
        //{
        //    using (shekelTestEntities dbContext = new shekelTestEntities())
        //    {
        //        return dbContext.Customers.ToList();
        //    }
        //}


    }
}

