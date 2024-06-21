@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Document(VH)'

define view entity ZTDI_VBAP_VH  as select from  I_SalesDocument
  association [0..1] to I_SalesOrganizationText   as _SalesOrganizationText   on  $projection.SalesOrganization   = _SalesOrganizationText.SalesOrganization
                                                                              and _SalesOrganizationText.Language = $session.system_language
  association [0..1] to I_DistributionChannelText as _DistributionChannelText on  $projection.DistributionChannel   = _DistributionChannelText.DistributionChannel
                                                                              and _DistributionChannelText.Language = $session.system_language
  association [0..1] to I_DivisionText            as _DivisionText            on  $projection.OrganizationDivision = _DivisionText.Division
                                                                              and _DivisionText.Language           = $session.system_language



{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 1
      @UI.selectionField:[{position: 20}]
  key  SalesDocument,

      @Search.fuzzinessThreshold: 0.5
      SalesOrganization,
      _SalesOrganizationText.SalesOrganizationName     as SalesOrganizationName,
      

      @Search.fuzzinessThreshold: 0.5
      DistributionChannel,
      _DistributionChannelText.DistributionChannelName as DistributionChannelName,
      

      @Search.fuzzinessThreshold: 0.5
      OrganizationDivision,
      _DivisionText.DivisionName                       as DivisionName
      


}
