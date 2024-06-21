@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery(item)'

define view entity ZTDI_LIPS as select from I_DeliveryDocumentItem

{
  key DeliveryDocument,
  key DeliveryDocumentItem,

      _DeliveryDocument.DocumentDate            as DocumentDate,
      _DeliveryDocument.PlannedGoodsIssueDate   as PlannedGoodsIssueDate,
      _DeliveryDocument.ActualGoodsMovementDate as ActualGoodsMovementDate,
      _DeliveryDocument.ShipToParty             as ShipToParty,

      Material,
      DeliveryDocumentItemText,
      ActualDeliveryQuantity,
      DeliveryQuantityUnit,
      BaseUnit,
      Plant,
      StorageLocation,
      
      _Plant.PlantName as PlantName,
      _StorageLocation.StorageLocationName as StorageLocationName
      ,
      ReferenceSDDocument,
      ReferenceSDDocumentItem
}
