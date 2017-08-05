using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace SF.Models
{
    public class AccountingIntegrator
    {
        private static SistemaFacturacionEntities db = new SistemaFacturacionEntities();

        private static HttpClient client = new HttpClient();

        public async static Task<object> PostAccountingReport( DateTime startDate, DateTime endDate )
        {
            var accountingEntries = GetAccountingEntries(startDate, endDate);
            var summary = SummarizeAccountingEntries(accountingEntries);

            HttpContent content = new StringContent(summary.ToJson(), Encoding.UTF8, "application/json");

            var response = await client.PostAsync("http://accountingintegration.azurewebsites.net/api/accountingentry", content);

            var responseString = await response.Content.ReadAsStringAsync();

            var responseObject = JsonConvert.DeserializeObject(responseString);

            return responseObject;
        }

        private static IEnumerable<v_AsientosContables> GetAccountingEntries(DateTime startDate, DateTime endDate)
        {
            return db.v_AsientosContables.Where(ac => ac.Fecha >= startDate && ac.Fecha <= endDate).ToList();
        }

        private static AccountingEntriesSummary SummarizeAccountingEntries(IEnumerable<v_AsientosContables> entries)
        {
            var summary = new AccountingEntriesSummary();
            summary.Description = "Reporte de facturación";
            summary.Auxiliary = new AuxiliaryDTO { Id = 3 };

            var transactionDictionary = new Dictionary<int, decimal>();
            var transactionList = new List<TransactionDTO>();

            foreach (var entry in entries)
            {
                if(!transactionDictionary.ContainsKey(entry.ID_CuentaContable))
                {
                    transactionDictionary[entry.ID_CuentaContable] = 0;
                }
                transactionDictionary[entry.ID_CuentaContable] += (decimal)entry.PrecioUnitario;
            }

            foreach (var keyValuePair in transactionDictionary)
            {
                transactionList.Add(new TransactionDTO()
                {
                    AccountingAccount = new AccountingAccountDTO { Id = keyValuePair.Key },
                    Amount = keyValuePair.Value,
                    Origin = "CREDIT"
                });
                transactionList.Add(new TransactionDTO()
                {
                    AccountingAccount = new AccountingAccountDTO { Id = 13 },
                    Amount = keyValuePair.Value,
                    Origin = "DEBIT"
                });
            }

            summary.Transactions = transactionList;

            return summary;
        }
    }
}