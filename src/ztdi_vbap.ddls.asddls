@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Document(Item)'
define root view entity  ZTDI_VBAP  as select from I_SalesDocumentItem

  association [1..1] to I_SalesDocument           as _SalesDocument           on  $projection.SalesDocument = _SalesDocument.SalesDocument

  association [0..1] to I_SalesOrganizationText   as _SalesOrganizationText   on  $projection.SalesOrganization   = _SalesOrganizationText.SalesOrganization
                                                                              and _SalesOrganizationText.Language = $session.system_language

  association [0..1] to I_DistributionChannelText as _DistributionChannelText on  $projection.DistributionChannel   = _DistributionChannelText.DistributionChannel
                                                                              and _DistributionChannelText.Language = $session.system_language

  association [0..1] to I_DivisionText            as _DivisionText            on  $projection.OrganizationDivision = _DivisionText.Division
                                                                              and _DivisionText.Language           = $session.system_language
 
  association [0..1] to I_ShippingPointText       as _Text                    on  $projection.ShippingPoint = _Text.ShippingPoint
                                                                              and _Text.Language            = $session.system_language
{
  key SalesDocument,
  key SalesDocumentItem,
      SalesDocumentDate,
      SalesOrganization,
      //      _SalesOrganizationText.SalesOrganizationName as SalesOrganizationName,
      DistributionChannel,
      //      _DistributionChannelText.DistributionChannelName as DistributionChannelName,
      OrganizationDivision,
      //      _DivisionText.DivisionName as DivisionName,
      TransactionCurrency,
      SoldToParty,
      _SoldToParty.CustomerName as SoldToPartyName,
      BillToParty,
      _BillToParty.CustomerName as BillToPartyName,
      PayerParty,
      _PayerParty.CustomerName  as PayerPartyName,
      ShipToParty,
      _ShipToParty.CustomerName as ShipToPartyName,
      Material,
      SalesDocumentItemText,
      OrderQuantity,
      OrderQuantityUnit,
      NetPriceAmount,
      NetPriceQuantity,
      NetPriceQuantityUnit,
      NetAmount,
      //      min( _ScheduleLine.DeliveryDate ) as DeliveryDate,
      Plant,
      _Plant.PlantName          as PlantName,
      ShippingPoint,
      _Text.ShippingPointName   as ShippingPointName,

      _SalesDocument,
      _DistributionChannelText,
      _SalesOrganizationText,
      _DivisionText
}
