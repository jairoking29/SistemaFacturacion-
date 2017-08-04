using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SF.Models
{
    public class AccountingIntegrator
    {
        private static SistemaFacturacionEntities db = new SistemaFacturacionEntities();

        public static void PostAccountingReport( DateTime startDate, DateTime endDate )
        {
            var accountingEntries = GetAccountingEntries(startDate, endDate);

        }

        private static IEnumerable<v_AsientosContables> GetAccountingEntries(DateTime startDate, DateTime endDate)
        {
            return db.v_AsientosContables.Where(ac => ac.Fecha >= startDate && ac.Fecha <= endDate).ToList();
        }

        private static  SummarizeAccountingEntries()
        {

        }
    }
}