@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document' 

define root view entity ZTDI_VBRP as select from I_BillingDocumentItem

association [1..1] to I_Customer as _Customer on $projection.PayerParty = _Customer.Customer

{
  key BillingDocument,  
  key BillingDocumentItem,
      PayerParty,
      _Customer.CustomerName as CustomerName,
      BillingDocumentDate,
      TransactionCurrency,
      BillingDocumentItemText,
      BillingQuantity,
      BillingQuantityUnit,
      NetAmount,
      Material,
      SalesDocument,
      SalesDocumentItem,
      ReferenceSDDocument,
      ReferenceSDDocumentItem
      
}
