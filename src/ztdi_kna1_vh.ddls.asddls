@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer(VH)'

define view entity ZTDI_KNA1_VH   as select from I_SalesDocumentPartner

  association [0..1] to I_Customer as _SoldToParty on $projection.Customer = _SoldToParty.Customer

{
        //      @UI.statusInfo: [{hidden: true}]
        //  key min(SalesDocument)        as SalesDocument,
        //      @Search.defaultSearchElement: true
        //      @Search.fuzzinessThreshold: 0.5
        //  key PartnerFunction,
        @Search.defaultSearchElement: true
        @Search.fuzzinessThreshold: 0.9
  key   Customer,

        @Search.fuzzinessThreshold: 0.9
        _SoldToParty.CustomerName as CustomerName
}

where
  PartnerFunction = 'AG'
group by
  PartnerFunction,
  Customer,
  _SoldToParty.CustomerName
