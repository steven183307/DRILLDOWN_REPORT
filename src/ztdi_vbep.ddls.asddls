@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Schedule line date'

define view entity ZTDI_VBEP as select from I_SalesDocumentScheduleLine 

{
    key SalesDocument,
    key SalesDocumentItem,

     min(DeliveryDate) as DeliveryDate
    
}
group by SalesDocument,SalesDocumentItem

