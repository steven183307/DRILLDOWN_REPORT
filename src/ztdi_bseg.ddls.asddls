@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting Document(Item)'

define view entity ZTDI_BSEG as select from I_OperationalAcctgDocItem
{
   key CompanyCode,
   key AccountingDocument,
   key FiscalYear,
   key AccountingDocumentItem,

   PostingKey,
   GLAccount,
   TransactionCurrency,
   AmountInTransactionCurrency,
   DebitCreditCode
}
