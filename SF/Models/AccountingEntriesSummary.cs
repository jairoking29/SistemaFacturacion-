﻿using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SF.Models
{

    public class AccountingEntriesSummary
    {
        public string Description { get; set; }

        public AuxiliaryDTO Auxiliary { get; set; }

        public IEnumerable<TransactionDTO> Transactions { get; set; }

        public string ToJson()
        {
            return JsonConvert.SerializeObject(this, new JsonSerializerSettings
            {
                ContractResolver = new CamelCasePropertyNamesContractResolver()
            });
        }
    }

    public class AuxiliaryDTO
    {
        public int Id { get; set; }
    }

    public class AccountingAccountDTO
    {
        public int Id { get; set; }
    }

    public class TransactionDTO
    {
        public AccountingAccountDTO AccountingAccount { get; set; }

        public string Origin { get; set; }

        public decimal Amount { get; set; }
    }
}