@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Accounting Document(Header)'
define root view entity  ZTDI_BKPF as select from I_JournalEntry

{
key CompanyCode,
key FiscalYear,
key AccountingDocument,
DocumentDate,
PostingDate,
DocumentReferenceID,
TransactionCurrency,

OriginalReferenceDocument,
 ReferenceDocumentType
 
}
