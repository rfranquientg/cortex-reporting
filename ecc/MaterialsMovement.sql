SELECT
  mseg.MANDT AS Client_MANDT,
  mseg.MBLNR AS NumberOfMaterialDocument_MBLNR,
  mseg.MJAHR AS MaterialDocumentYear_MJAHR,
  mseg.ZEILE AS ItemInMaterialDocument_ZEILE,
  mseg.MATNR AS MaterialNumber_MATNR,
  mseg.CHARG AS BatchNumber_CHARG,
  mseg.WERKS AS Plant_WERKS,
  mseg.LGORT AS StorageLocation_LGORT,
  mseg.BWART AS MovementType_BWART,
  mseg.INSMK AS StockType_INSMK,
  mseg.SHKZG AS Debit_CreditIndicator_SHKZG,
  mseg.MENGE AS Quantity_MENGE,
  mseg.MEINS AS BaseUnitOfMeasure_MEINS,
  mseg.WAERS AS CurrencyKey_WAERS,
  mseg.EBELN AS PurchaseOrderNumber_EBELN,
  mseg.LIFNR AS VendorsAccountNumber_LIFNR,
  mseg.KDAUF AS SalesOrderNumber_KDAUF,
  mseg.KUNNR AS AccountNumberOfCustomer_KUNNR,
  mseg.UMMAT AS Receiving_IssuingMaterial_UMMAT,
  mseg.UMCHA AS Receiving_Issuing_Batch_UMCHA,
  mseg.EBELP AS ItemNumberOfPurchasingDocument_EBELP,
  mseg.LFBNR AS DocumentNumberOfAReferenceDocument_LFBNR,
  mseg.LFPOS AS ItemOfAReferenceDocument_LFPOS,
  mseg.AUFNR AS OrderNumber_AUFNR,
  mseg.BUKRS AS CompanyCode_BUKRS,
  mseg.UMWRK AS ReceivingPlant_UMWRK,
  mseg.UMLGO AS Receiving_IssuingStorageLocation_UMLGO,
  mseg.LGNUM AS WarehouseNumber_LGNUM,
  mseg.BWLVS AS MovementTypeForWarehouseManagement_BWLVS,
  mseg.XBLVS AS Indicator_PostingInWarehouseManagementSystem_XBLVS,
  mseg.BESTQ AS StockCategoryInTheWarehouseManagementSystem_BESTQ,
  mseg.SOBKZ AS SpecialStockIndicator_SOBKZ,
  mseg.KZBEW AS MovementIndicator_KZBEW,
  mseg.GRUND AS ReasonForMovement_GRUND,
  mseg.WEUNB AS GoodsReceipt_Non_Valuated_WEUNB,
  mseg.LGTYP AS StorageType_LGTYP,
  mseg.EQUNR AS EquipmentNumber_EQUNR,
  mseg.GSBER AS BusinessArea_GSBER,
  mseg.KOSTL AS CostCenter_KOSTL,
  mseg.PRCTR AS ProfitCenter_PRCTR,
  mseg.PS_PSP_PNR AS WorkBreakdownStructureElement_PS_PSP_PNR,
  mseg.SAKTO AS GLAccountNumber_SAKTO,
  mseg.SHKUM AS Debit_CreditIndicatorInRevaluation_SHKUM,
  mseg.BWTAR AS ValuationType_BWTAR,
  mseg.KZZUG AS ReceiptIndicator_KZZUG,
  mseg.BUDAT_MKPF AS PostingDate_BUDAT_MKPF,
  --##CORTEX-CUSTOMER Consider adding other dimensions from the calendar_date_dim table as per your requirement
  CalendarDateDim_BUDAT_MKPF.CalYear AS YearOfPostingDate_BUDAT_MKPF,
  CalendarDateDim_BUDAT_MKPF.CalMonth AS MonthOfPostingDate_BUDAT_MKPF,
  CalendarDateDim_BUDAT_MKPF.CalWeek AS WeekOfPostingDate_BUDAT_MKPF,
  CalendarDateDim_BUDAT_MKPF.CalQuarter AS QuarterOfPostingDate_BUDAT_MKPF,
  CalendarDateDim_BUDAT_MKPF.WeekEndDate AS WeekEndDateOfPostingDate_BUDAT_MKPF,
  --##CORTEX-CUSTOMER If you prefer to use currency conversion, uncomment below
  -- currency_conversion.UKURS AS ExchangeRate_UKURS,
  -- currency_conversion.TCURR AS TargetCurrency_TCURR,
  -- currency_conversion.conv_date AS Conversion_date,
  -- mseg.DMBTR * currency_conversion.UKURS AS AmountInTargetCurrency_DMBTR,
  -- mseg.LINE_ID AS UniqueIdentificationOfDocument_Line_LINE_ID,
  -- mseg.PARENT_ID AS IdentifierOfImmediatelySuperiorLine_PARENT_ID,
  -- mseg.lINE_DEPTH AS HierarchyLevelOfLineInDocument_lINE_DEPTH,
  -- mseg.MAA_URZEI AS OriginalLineForAccountAssignmentItemInMaterialDoc_MAA_URZEI,
  -- mseg.XAUTO AS ItemAutomaticallyCreated_XAUTO ,
  -- mseg.ZUSCH AS BatchStatusKey_ZUSCH,
  -- mseg.ZUSTD AS BatchInRestricted_UseStock_ZUSTD,
  -- mseg.KDPOS AS ItemNumberInSalesOrder_KDPOS,
  -- mseg.KDEIN AS DeliveryScheduleForSalesOrder_KDEIN,
  -- mseg.PLPLA AS DistributionOfDifferences_PLPLA,
  -- mseg.BNBTR AS DeliveryCostsInLocalCurrency_BNBTR,
  -- mseg.BUALT AS AmountPostedInAlternativePriceControl_BUALT,
  -- mseg.DMBUM AS RevaluationAmountOnBack_PostingToAPreviousPeriod_DMBUM,
  -- mseg.ERFMG AS QuantityInUnitOfEntry_ERFMG,
  -- mseg.ERFME AS UnitOfEntry_ERFME,
  -- mseg.BPMNG AS QuantityInPurchaseOrderPriceUnit_BPRME,
  -- mseg.BPRME AS OrderPriceUnit_Purchasing_BPRME,
  -- mseg.LFBJA AS FiscalYearOfAReferenceDocument_LFBJA,
  -- mseg.SJAHR AS MaterialDocumentYear_SJAHR,
  -- mseg.SMBLN AS NumberOfMaterialDocument_SMBLN,
  -- mseg.SMBLP AS NumberOfMaterialDocument_SMBLP,
  -- mseg.ELIKZ AS DeliveryCompleted_Indicator_ELIKZ,
  -- mseg.SGTXT AS ItemText_SGTXT,
  -- mseg.WEMPF AS GoodsRecipient_WEMPF,
  -- mseg.ABLAD AS UnloadingPoint_ABLAD,
  -- mseg.KOKRS AS ControllingArea_KOKRS,
  -- mseg.PARGB AS TradingPartnerBusinessArea_PARGB,
  -- mseg.PARBU AS ClearingCompanyCode_PARBU,
  -- mseg.PROJN AS Old_ProjectNumber_NoLongerUsed_PS_POSNR_PROJN,
  -- mseg.ANLN1 AS MainAssetNumber_ANLN1,
  -- mseg.ANLN2 AS AssetSubnumber_ANLN2,
  -- mseg.XSKST AS Indicator_StatisticalPostingToCostCenter_XSKST,
  -- mseg.XSAUF AS Indicator_PostingToOrderIsStatistical_XSAUF,
  -- mseg.XSPRO AS Indicator_PostingToProjectIsStatistical_XSPRO,
  -- mseg.XSERG AS Indicator_PostingToProfitabilityAnalysisIsStatistical_XSERG,
  -- mseg.GJAHR AS FiscalYear_GJAHR,
  -- mseg.XRUEM AS AllowPostingToPreviousPeriod_Backposting_XRUEM,
  -- mseg.XRUEJ AS Indicator_PostToPreviousYear_XRUEJ,
  -- mseg.BELNR AS AccountingDocumentNumber_BELNR,
  -- mseg.BUZEI AS NumberOfLineItemWithinAccountingDocument_BUZEI,
  -- mseg.BELUM AS AccountingDocumentNumber_BELUM,
  -- mseg.BUZUM AS NumberOfLineItemWithinAccountingDocument_BUZUM,
  -- mseg.RSNUM AS NumberOfReservation_dependentRequirements_RSNUM,
  -- mseg.RSPOS AS ItemNumberOfReservation_DependentRequirements_RSPOS,
  -- mseg.KZEAR AS FinalIssueForThisReservation_KZEAR,
  -- mseg.PBAMG AS Quantity_PBAMG,
  -- mseg.KZSTR AS Transaction_EventIsRelevantToStatistics_KZSTR,
  -- mseg.UMZST AS StatusOfTransferBatch_UMZST,
  -- mseg.UMZUS AS StatusKeyOfTransferBatch_UMZUS,
  -- mseg.UMBAR AS ValuationTypeOfTransferBatch_UMBAR,
  -- mseg.UMSOK AS SpecialStockIndicatorForPhysicalStockTransfer_UMSOK,
  -- mseg.KZBEW AS MovementIndicator_KZBEW,
  -- mseg.KZVBR AS ConsumptionPosting_KZVBR,
  -- mseg.PALAN AS WMSNumberOfPallets_PALAN,
  -- mseg.LGPLA AS StorageBin_LGPLA,
  -- mseg.TBNUM AS TransferRequirementNumber_TBNUM,
  -- mseg.TBPOS AS 	TransferRequirementItem_TBPOS,
  -- mseg.VSCHN AS Ind_InterimStoragePostingForSourceStor_typeAndBin_VSCHN,
  -- mseg.NSCHN AS Ind_InterimStoragePostingForDest_Stor_TypeAndBin_NSCHN,
  -- mseg.DYPLA AS Indicator_DynamicStorageBin_DYPLA,
  -- mseg.UBNUM AS PostingChangeNumber_UBNUM,
  -- mseg.TBPRI AS TransferPriority_TBPRI,
  -- mseg.TANUM AS TransferOrderNumber_TANUM,
  -- mseg.WEANZ AS NumberOfGR_GI_SlipsToBePrinted_WEANZ,
  -- mseg.EVERS AS ShippingInstructions_EVERS,
  -- mseg.EVERE AS ComplianceWithShippingInstructions_EVERE,
  -- mseg.IMKEY AS InternalKeyForRealEstateObject_IMKEY,
  -- mseg.KSTRG AS CostObject_KSTRG,
  -- mseg.PAOBJNR AS ProfitabilitySegmentNumber_COPA_PAOBJNR,
  -- mseg.NPLNR AS NetworkNumberForAccountAssignment_NPLNR,
  -- mseg.AUFPL AS RoutingNumberOfOperationsInTheOrder_AUFPL,
  -- mseg.APLZL AS InternalCounter_APLZL,
  -- mseg.AUFPS AS OrderItemNumber_AUFPS,
  -- mseg.VPTNR AS PartnerAccountNumber_VPTNR,
  -- mseg.FIPOS AS CommitmentItem_FIPOS,
  -- mseg.BSTMG AS GoodsReceiptQuantityInOrderUnit_BSTMG,
  -- mseg.BSTME AS PurchaseOrderUnitOfMeasure_BSTME,
  -- mseg.XWSBR AS ReversalOfGRAllowedForGR_BasedIVDespiteInvoice_XWSBR,
  -- mseg.EMLIF AS VendorToBeSupplied_WhoIsToReceiveDelivery_EMLIF,
  -- mseg.EXBWR AS ExternallyEnteredPostingAmountInLocalCurrency_EXBWR,
  -- mseg.VKWRT AS ValueAtSalesPricesIncludingValue_AddedTax_VKWRT,
  -- mseg.AKTNR AS Promotion_AKTNR,
  -- mseg.ZEKKN AS SequentialNumberOfAccountAssignment_ZEKKN,
  -- mseg.VFDAT AS ShelfLifeExpirationOrBest_BeforeDate_VFDAT,
  -- mseg.CUOBJ_CH AS InternalObjectNumberOfTheBatchClassification_CUOBJ_CH,
  -- mseg.EXVKW AS ExternallyEnteredSalesValueInLocalCurrency_EXVKW,
  -- mseg.PPRCTR AS PartnerProfitCenter_PPRCTR,
  -- mseg.RSART AS RecordType_RSART,
  -- mseg.GEBER AS Fund_GEBER,
  -- mseg.FISTL AS FundsCenter_FISTL,
  -- mseg.MATBF AS MaterialInRespectOfWhichStockIsManaged_MATBF,
  -- mseg.UMMAB AS Receiving_IssuingMaterial_UMMAB,
  -- mseg.BUSTM AS PostingStringForQuantities_BUSTM,
  -- mseg.BUSTW AS PostingStringForValues_BUSTW,
  -- mseg.MENGU AS QuantityUpdatingInMaterialMasterRecord_MENGU,
  -- mseg.WERTU AS ValueUpdatingInMaterialMasterRecord_WERTU,
  -- mseg.LBKUM AS TotalValuatedStockBeforeThePosting_LBKUM,
  -- mseg.SALK3 AS ValueOfTotalValuatedStockBeforeThePosting_SALK3,
  -- mseg.VPRSV AS PriceControlIndicator_VPRSV,
  -- mseg.FKBER AS FunctionalArea_FKBER,
  -- mseg.DABRBZ AS ReferenceDateForSettlement_DABRBZ,
  -- mseg.VKWRA AS ValueAtSalesPricesExcludingValue_AddedTax_VKWRA,
  -- mseg.DABRZ AS ReferenceDateForSettlement_DABRZ,
  -- mseg.XBEAU AS PurchaseOrderCreatedAtTimeOfGoodsReceipt_XBEAU,
  -- mseg.LSMNG AS QuantityInUnitOfMeasureFromDeliveryNote_LSMNG,
  -- mseg.LSMEH AS UnitOfMeasureFromDeliveryNote_LSMEH,
  -- mseg.KZBWS AS ValuationOfSpecialStock_KZBWS,
  -- mseg.QINSPST AS StatusOfGoodsReceiptInspection_QINSPST,
  -- mseg.URZEI AS OriginalLineInMaterialDocument_URZEI,
  -- mseg.J_1BEXBASE AS AlternateBaseAmountInDocumentCurrency_J_1BEXBAS,
  -- mseg.MWSKZ AS TaxOnSales_PurchasesCode_MWSKZ,
  -- mseg.TXJCD AS TaxJurisdiction_TXJCD,
  -- mseg.EMATN AS MaterialNumberCorrespondingToManufacturerPartNumber_EMATN,
  -- mseg.J_1AGIRUPD AS GoodsIssueRevaluationPerformed_J_1AGIRUPD,
  -- mseg.VKMWS AS TaxOnSales_PurchasesCode_VKMWS,
  -- mseg.HSDAT AS DateOfManufacture_HSDAT,
  -- mseg.BERKZ AS MaterialStagingIndicatorForProductionSupply_BERKZ,
  -- mseg.MAT_KDAUF AS SalesOrderNumberOfValuatedSalesOrderStock_MAT_KDAUF_MAT_KDAUF,
  -- mseg.MAT_KDPOS AS SalesOrderItemOfValuatedSalesOrderStock_MAT_KDPOS,
  -- mseg.MAT_PSPNR AS ValuatedSalesOrderStockWBS_Element_MAT_PSPNR,
  -- mseg.XWOFF AS CalculationOfVal_Open_XWOFF,
  -- mseg.BEMOT AS AccountingIndicator_BEMOT,
  -- mseg.PRZNR AS BusinessProcess_PRZNR,
  -- mseg.LLIEF AS SupplyingVendor_LLIEF,
  -- mseg.LSTAR AS ActivityType_LSTAR,
  -- mseg.XOBEW AS VendorStockValuationIndicator_XOBEW,
  -- mseg.GRANT_NBR AS Grant_GRANT_NBR,
  -- mseg.ZUSTD_T156M AS StockTypeModification_ZUSTD_T156M,
  -- mseg.SPE_GTS_STOCK_TY AS GTSStockType_SPE_GTS_STOCK_TY,
  -- mseg.KBLNR AS DocumentNumberForEarmarkedFunds_KBLNR,
  -- mseg.KBLPOS AS EarmarkedFunds_DocumentItem_KBLPOS,
  -- mseg.XMACC AS MultipleAccountAssignment_XMACC,
  -- mseg.VGART_MKPF AS Transaction_EventType_VGART_MKPF,
  -- mseg.CPUDT_MKPF AS DayOnWhichAccountingDocumentWasEntered_CPUDT_MKPF,
  -- mseg.CPUTM_MKPF AS TimeOfEntry_CPUTM_MKPF,
  -- mseg.USNAM_MKPF AS UserName_USNAM_MKPF,
  -- mseg.XBLNR_MKPF AS ReferenceDocumentNumber_XBLNR_MKP,
  -- mseg.TCODE2_MKPF AS TransactionCode_TCODE2_MKPF,
  -- mseg.VBELN_IM AS Delivery_VBELN_IM,
  -- mseg.VBELP_IM AS DeliveryItem_VBELP_IM,
  -- mseg.SGT_SCAT AS StockSegment_SGT_SCAT,
  -- mseg.SGT_UMSCAT AS Receiving_IssuingStockSegment_SGT_UMSCAT,
  -- mseg.SGT_RCAT AS RequirementSegment_SGT_RCAT,
  -- mseg.BEV2_ED_KZ_VER AS ProcessingStatusOfMaterialDocumentForExciseDuties_BEV2_ED_KZ_VER,
  -- mseg.BEV2_ED_USER AS UserName_BEV2_ED_USER,
  -- mseg.BEV2_ED_AEDAT AS DateOfLastChange_BEV2_ED_AEDAT,
  -- mseg.BEV2_ED_AETIM AS SystemTime_BEV2_ED_AETIM,
  -- mseg.DISUB_OWNER AS OwnerOfStock_DISUB_OWNER,
  -- mseg.FSH_SEASON_YEAR AS SeasonYear_FSH_SEASON_YEAR,
  -- mseg.FSH_SEASON AS Season_FSH_SEASON,
  -- mseg.FSH_COLLECTION AS FashionCollection_FSH_COLLECTION,
  -- mseg.FSH_THEME AS FashionTheme_FSH_THEME,
  -- mseg.FSH_UMSEA_YR AS Receiving_IssuingSeasonYear_FSH_UMSEA_YR,
  -- mseg.FSH_UMSEA AS Receiving_IssuingSeason_FSH_UMSEA,
  -- mseg.FSH_UMCOLL AS Receiving_IssuingCollection_FSH_UMCOLL,
  -- mseg.FSH_UMTHEME AS Receiving_IssuingTheme_FSH_UMTHEME,
  -- mseg.SGT_CHINT AS DiscreteBatchNumber_SGT_CHINT,
  -- mseg.FSH_DEALLOC_QTY AS ArunAllocatedQuantity_FSH_DEALLOC_QTY,
  -- mseg.OINAVNW AS Non_DeductibleInputTax_OINAVNW,
  -- mseg.OICONDCOD AS JointVentureIndicator_ConditionKey_OICONDCOD,
  -- mseg.CONDI AS JointVentureIndicator_CONDI,
  -- mseg.WRF_CHARSTC1 AS CharacteristicValue1_WRF_CHARSTC1,
  -- mseg.WRF_CHARSTC2 AS CharacteristicValue2_WRF_CHARSTC2,
  -- mseg.WRF_CHARSTC3 AS CharacteristicValue3_WRF_CHARSTC3,
  COALESCE(mseg.DMBTR * currency_decimal.CURRFIX, mseg.DMBTR) AS AmountInLocalCurrency_DMBTR
FROM `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.mseg` AS mseg
--Fix the decimal place of amounts for non-decimal-based currencies such as JPY, IDR, KRW, TWD etc.
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.currency_decimal` AS currency_decimal
  ON mseg.WAERS = currency_decimal.CURRKEY
--##CORTEX-CUSTOMER If you prefer to use currency conversion, uncomment below
-- LEFT JOIN
--     `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.currency_conversion` AS currency_conversion
--     ON mseg.MANDT = currency_conversion.MANDT
--       AND mseg.WAERS = currency_conversion.FCURR
--       AND mseg.BUDAT_MKPF = currency_conversion.conv_date
--       AND currency_conversion.TCURR {{ currency }}
--##CORTEX-CUSTOMER Modify the exchange rate type based on your requirement
--       AND currency_conversion.KURST = 'M'
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.calendar_date_dim` AS CalendarDateDim_BUDAT_MKPF
  ON mseg.BUDAT_MKPF = CalendarDateDim_BUDAT_MKPF.Date
