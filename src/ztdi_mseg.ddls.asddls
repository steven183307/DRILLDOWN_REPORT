@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Document'
define root view entity ZTDI_MSEG   as select from I_MaterialDocumentItem_2


  association [0..1] to I_MaterialDocumentHeader_2 as _MaterialDocumentHeader on  $projection.MaterialDocument     = _MaterialDocumentHeader.MaterialDocument
                                                                              and $projection.MaterialDocumentYear = _MaterialDocumentHeader.MaterialDocumentYear

  association [0..1] to I_GoodsMovementTypeT       as _GoodsMovementTypeT     on  $projection.GoodsMovementType = _GoodsMovementTypeT.GoodsMovementType
                                                                              and _GoodsMovementTypeT.Language  = $session.system_language


{

  key MaterialDocumentYear,
  key MaterialDocument,
  key MaterialDocumentItem,
      PostingDate,
      GoodsMovementType,
      _GoodsMovementTypeT.GoodsMovementTypeName as GoodsMovementTypeName,
      Material,
      Plant,
      _Plant.PlantName                          as PlantName,
      StorageLocation,
      _StorageLocation.StorageLocationName      as StorageLocationName,
      QuantityInBaseUnit,
      MaterialBaseUnit,
      _MaterialDocumentHeader,
      DeliveryDocument,
      DeliveryDocumentItem
}
