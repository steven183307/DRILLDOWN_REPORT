@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Billing Document(VH)'

define view entity ZTDI_VBRP_VH  as select  from I_BillingDocumentItem

//  association [0..1] to I_BillingDocumentBasic as _BillingDocumentBasic on $projection.BillingDocument =  _BillingDocumentBasic.BillingDocument
{
      
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.5
//      @Semantics.text: true
 key lpad( BillingDocument , 10, '0' ) as BillingDocument
//  key cast(BillingDocument as abap.numc( 10 )) as BillingDocument
      
//      @Search.fuzzinessThreshold: 0.5
//      _BillingDocumentBasic.CompanyCode as CompanyCode,

//      @Search.fuzzinessThreshold: 0.5
//      _BillingDocumentBasic.FiscalYear as FiscalYear
}
