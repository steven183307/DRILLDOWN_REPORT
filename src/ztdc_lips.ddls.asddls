@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Delivery(item)'

@UI.headerInfo:{
    typeNamePlural: 'Delivery Document(Item)',
    typeName: 'Delivery Document ITem',
    title.value: 'DeliveryDocument',
    description: {type: #STANDARD,
                  value : 'DeliveryDocumentItem'
     }
    }
define view entity ZTDC_LIPS  as select from ZTDI_LIPS
  
  association [0..*] to  ZTDC_VBRP as _ZTDC_VBRP on $projection.DeliveryDocument = _ZTDC_VBRP.ReferenceSDDocument
                                        and $projection.DeliveryDocumentItem = _ZTDC_VBRP.ReferenceSDDocumentItem  
  association [0..*] to  ZTDC_MSEG as _ZTDC_MSEG on $projection.DeliveryDocument = _ZTDC_MSEG.DeliveryDocument
                                        and $projection.DeliveryDocumentItem = _ZTDC_MSEG.DeliveryDocumentItem
  

{
      @UI.facet: [

      {
                   id: 'BillingDocument',
                    purpose: #STANDARD,
                    position: 40,
                    type: #LINEITEM_REFERENCE,
                    targetElement: '_ZTDC_VBRP',
                    label: 'Billing Document'
       }
       ,
             {
                   id: 'MaterialDocument',
                    purpose: #STANDARD,
                    position: 30,
                    type: #LINEITEM_REFERENCE,
                    targetElement: '_ZTDC_MSEG',
                    label: 'MaterialDocument'
      }
      ,
       {
                      label: 'Delivery Info',
                      id: 'COLLFAC1',
                      type: #COLLECTION,
                      position: 10
       }
       ,
       {
                      label: 'Delivery Data',
                      parentId: 'COLLFAC1',
                      type: #IDENTIFICATION_REFERENCE,
                      position: 20,
                      targetQualifier: 'header'
        }
         ,
       {
                      label: 'Item Info',
                      id: 'COLLFAC2',
                      type: #COLLECTION,
                      position: 20
       }
       ,
       {
                      label: 'Delivery Item Data',
                      parentId: 'COLLFAC2',
                      type: #IDENTIFICATION_REFERENCE,
                      position: 20,
                      targetQualifier: 'Item'
        }
      
      ]

      @UI.identification: [{position: 10 , label: 'DeliveryDocument' , qualifier: 'header'}]
  key DeliveryDocument,
      @UI.identification: [{position: 20 , label: 'DeliveryDocumentItem' , qualifier: 'header'}]
      @UI.lineItem: [{position: 10,label: 'DeliveryDocumentItem' }]
  key DeliveryDocumentItem,
//      @UI.lineItem: [{position: 20,label: 'DocumentDate'}]
      DocumentDate,
//      @UI.lineItem: [{position: 30,label: 'PlannedGoodsIssueDate'}]
      PlannedGoodsIssueDate,
//      @UI.lineItem: [{position: 40,label: 'ActualGoodsMovementDate'}]
      ActualGoodsMovementDate,
//      @UI.lineItem: [{position: 50,label: 'ShipToParty'}]
      ShipToParty,
      @UI.identification: [{position: 10 , label: 'Material' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 20,label: 'Material'}]
      Material,
      @UI.identification: [{position: 20 , label: 'DeliveryDocumentItemText' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 30,label: 'DeliveryDocumentItemText'}]
      DeliveryDocumentItemText,
      @UI.identification: [{position: 30 , label: 'ActualDeliveryQuantity' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 40,label: 'ActualDeliveryQuantity'}]
      ActualDeliveryQuantity,
      @UI.identification: [{position: 40 , label: 'DeliveryQuantityUnit' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 50,label: 'DeliveryQuantityUnit'}]
      DeliveryQuantityUnit,
      @UI.identification: [{position: 50 , label: 'BaseUnit' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 60,label: 'BaseUnit'}]
      BaseUnit,
      @UI.identification: [{position: 60 , label: 'Plant' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 70,label: 'Plant'}]
      Plant,
      @UI.identification: [{position: 70 , label: 'PlantName' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 80,label: 'PlantName'}]
      PlantName,
      @UI.identification: [{position: 80 , label: 'StorageLocation' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 90,label: 'StorageLocation'}]
      StorageLocation,
      @UI.identification: [{position: 90 , label: 'StorageLocationName' , qualifier: 'Item'}]
      @UI.lineItem: [{position: 100,label: 'StorageLocationName'}]
      StorageLocationName,
      
      //      @UI.lineItem: [{position: 10,label: 'SalesDocument'}]
      ReferenceSDDocument,
      //      @UI.lineItem: [{position: 10,label: 'SalesDocumentItem'}]
      ReferenceSDDocumentItem,
      
       _ZTDC_MSEG,
       _ZTDC_VBRP


}
