using shekelTest_Gitit_Luria.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace shekelTest_Gitit_Luria.Controllers
{
    public class LogicController : ApiController
    {


        //Logical function for adding a customer to the Customers table and adding row in FactoriesToCustomer table .
        public Customer AddCustomer(CustomerToAdd CToA)
        {

            using (shekelTestEntities dbContext = new shekelTestEntities())
            {
                Customer customerToAdd = new Customer
                {
                    customerId = CToA.customerId,
                    name = CToA.name,
                    address = CToA.address,
                    phone = CToA.phone
                };

                dbContext.Customers.Add(customerToAdd);

                dbContext.SaveChanges();


                FactoriesToCustomer fToCToSend = new FactoriesToCustomer
                {
                    groupCode = CToA.groupCode,
                    factoryCode = CToA.factoryCode,
                    customerId = CToA.customerId
                };

                AddFactoriesToCustomer(fToCToSend);
        

                return customerToAdd;
            };
        }

        public FactoriesToCustomer AddFactoriesToCustomer(FactoriesToCustomer fToC)
        {

            using (shekelTestEntities dbContext = new shekelTestEntities())
            {
                FactoriesToCustomer fToCToAdd = new FactoriesToCustomer
                {
                    groupCode = fToC.groupCode,
                    factoryCode = fToC.factoryCode,
                    customerId = fToC.customerId
                };

                dbContext.FactoriesToCustomers.Add(fToCToAdd);

                dbContext.SaveChanges();


                return fToC;
            };
        }
    }
}