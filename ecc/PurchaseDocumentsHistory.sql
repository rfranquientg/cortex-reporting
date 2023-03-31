SELECT
  ekbe.MANDT AS Client_MANDT,
  ekbe.EBELN AS PurchasingDocumentNumber_EBELN,
  ekbe.EBELP AS ItemNumberOfPurchasingDocument_EBELP,
  ekbe.ZEKKN AS SequentialNumberOfAccountAssignment_ZEKKN,
  ekbe.VGABE AS TransactioneventType_VGABE,
  ekbe.GJAHR AS MaterialDocumentYear_GJAHR,
  ekbe.BELNR AS NumberOfMaterialDocument_BELNR,
  ekbe.BUZEI AS ItemInMaterialDocument_BUZEI,
  ekbe.BEWTP AS PurchaseOrderHistoryCategory_BEWTP,
  ekbe.BWART AS MovementType__inventoryManagement___BWART,
  ekbe.BUDAT AS PostingDateInTheDocument_BUDAT,
  ekbe.MENGE AS Quantity_MENGE,
  ekbe.BPMNG AS QuantityInPurchaseOrderPriceUnit_BPMNG,
  ekbe.WAERS AS CurrencyKey_WAERS,
  -- ekbe.WESBS AS GoodsReceiptBlockedStockInOrderUnit_WESBS,
  -- ekbe.BPWES AS QuantityInGrBlockedStockInOrderPriceUnit_BPWES,
  -- ekbe.SHKZG AS DebitCreditIndicator_SHKZG,
  -- ekbe.BWTAR AS ValuationType_BWTAR,
  -- ekbe.ELIKZ AS DeliveryCompleted_ELIKZ,
  -- ekbe.XBLNR AS ReferenceDocumentNumber_XBLNR,
  -- ekbe.LFGJA AS FiscalYearOfAReferenceDocument_LFGJA,
  -- ekbe.LFBNR AS DocumentNoOfAReferenceDocument_LFBNR,
  -- ekbe.LFPOS AS ItemOfAReferenceDocument_LFPOS,
  -- ekbe.GRUND AS ReasonForMovement_GRUND,
  -- ekbe.CPUDT AS DayOnWhichAccountingDocumentWasEntered_CPUDT,
  -- ekbe.CPUTM AS TimeOfEntry_CPUTM,
  -- ekbe.EVERE AS ComplianceWithShippingInstructions_EVERE,
  -- ekbe.REFWR AS InvoiceValueInForeignCurrency_REFWR,
  -- ekbe.MATNR AS MaterialNumber_MATNR,
  -- ekbe.WERKS AS Plant_WERKS,
  -- ekbe.XWSBR AS ReversalOfGrAllowedForGrBasedIvDespiteInvoice_XWSBR,
  -- ekbe.ETENS AS SequentialNumberOfVendorConfirmation_ETENS,
  -- ekbe.KNUMV AS NumberOfTheDocumentCondition_KNUMV,
  -- ekbe.MWSKZ AS TaxOnSalespurchasesCode_MWSKZ,
  -- ekbe.LSMNG AS QuantityInUnitOfMeasureFromDeliveryNote_LSMNG,
  -- ekbe.LSMEH AS UnitOfMeasureFromDeliveryNote_LSMEH,
  -- ekbe.EMATN AS MaterialNumber_EMATN,
  -- ekbe.HSWAE AS LocalCurrencyKey_HSWAE,
  -- ekbe.BAMNG AS Quantity_BAMNG,
  -- ekbe.CHARG AS BatchNumber_CHARG,
  ekbe.BLDAT AS DocumentDateInDocument_BLDAT,
  -- ekbe.XWOFF AS CalculationOfValOpen_XWOFF,
  -- ekbe.XUNPL AS UnplannedAccountAssignmentFromInvoiceVerification_XUNPL,
  -- ekbe.ERNAM AS NameOfPersonWhoCreatedTheObject_ERNAM,
  -- ekbe.SRVPOS AS ServiceNumber_SRVPOS,
  -- ekbe.PACKNO AS PackageNumberOfService_PACKNO,
  -- ekbe.INTROW AS LineNumberOfService_INTROW,
  -- ekbe.BEKKN AS NumberOfPoAccountAssignment_BEKKN,
  -- ekbe.LEMIN AS ReturnsIndicator_LEMIN,
  -- ekbe.AREWB AS ClearingValueOnGrirAccountInPoCurrency_AREWB,
  -- ekbe.REWRB AS InvoiceAmountInPoCurrency_REWRB,
  -- ekbe.SAPRL AS SapRelease_SAPRL,
  -- ekbe.MENGE_POP AS Quantity_MENGE_POP,
  -- ekbe.BPMNG_POP AS QuantityInPurchaseOrderPriceUnit_BPMNG_POP,
  -- ekbe.DMBTR_POP AS AmountInLocalCurrency_DMBTR_POP,
  -- ekbe.WRBTR_POP AS AmountInDocumentCurrency_WRBTR_POP,
  -- ekbe.WESBB AS ValuatedGoodsReceiptBlockedStockInOrderUnit_WESBB,
  -- ekbe.BPWEB AS QuantityInValuatedGrBlockedStockInOrderPriceUnit_BPWEB,
  -- ekbe.WEORA AS AcceptanceAtOrigin_WEORA,
  -- ekbe.AREWR_POP AS GrirAccountClearingValueInLocalCurrency_AREWR_POP,
  -- ekbe.KUDIF AS ExchangeRateDifferenceAmount_KUDIF,
  -- ekbe.RETAMT_FC AS RetentionAmountInDocumentCurrency_RETAMT_FC,
  -- ekbe.RETAMT_LC AS RetentionAmountInCompanyCodeCurrency_RETAMT_LC,
  -- ekbe.RETAMTP_FC AS PostedRetentionAmountInDocumentCurrency_RETAMTP_FC,
  -- ekbe.RETAMTP_LC AS PostedSecurityRetentionAmountInCompanyCodeCurrency_RETAMTP_LC,
  -- ekbe.XMACC AS MultipleAccountAssignment_XMACC,
  -- ekbe.WKURS AS ExchangeRate_WKURS,
  -- ekbe.INV_ITEM_ORIGIN AS OriginOfAnInvoiceItem_INV_ITEM_ORIGIN,
  -- ekbe.VBELN_ST AS Delivery_VBELN_ST,
  -- ekbe.VBELP_ST AS DeliveryItem_VBELP_ST,
  -- ekbe.SGT_SCAT AS StockSegment_SGT_SCAT,
  -- ekbe.ET_UPD AS ProcedureForUpdatingTheScheduleLineQuantity_ET_UPD,
  -- ekbe.J_SC_DIE_COMP_F AS DepreciationCompletionFlag_J_SC_DIE_COMP_F,
  -- ekbe.FSH_SEASON_YEAR AS SeasonYear_FSH_SEASON_YEAR,
  -- ekbe.FSH_SEASON AS Season_FSH_SEASON,
  -- ekbe.FSH_COLLECTION AS FashionCollection_FSH_COLLECTION,
  -- ekbe.FSH_THEME AS FashionTheme_FSH_THEME,
  -- ekbe.WRF_CHARSTC1 AS CharacteristicValue1_WRF_CHARSTC1,
  -- ekbe.WRF_CHARSTC2 AS CharacteristicValue2_WRF_CHARSTC2,
  -- ekbe.WRF_CHARSTC3 AS CharacteristicValue3_WRF_CHARSTC3,
  --##CORTEX-CUSTOMER Consider adding other dimensions from the calendar_date_dim table as per your requirement
  CalendarDateDimension_BUDAT.CalYear AS YearOfPostingDateInTheDocument_BUDAT,
  CalendarDateDimension_BUDAT.CalMonth AS MonthOfPostingDateInTheDocument_BUDAT,
  CalendarDateDimension_BUDAT.CalWeek AS WeekOfPostingDateInTheDocument_BUDAT,
  CalendarDateDimension_BUDAT.CalQuarter AS QuarterOfPostingDateInTheDocument_BUDAT,
  CalendarDateDimension_BLDAT.CalYear AS YearOfDocumentDateInDocument_BLDAT,
  CalendarDateDimension_BLDAT.CalMonth AS MonthOfDocumentDateInDocument_BLDAT,
  CalendarDateDimension_BLDAT.CalWeek AS WeekOfDocumentDateInDocument_BLDAT,
  CalendarDateDimension_BLDAT.CalQuarter AS QuarterOfDocumentDateInDocument_BLDAT,
  COALESCE(ekbe.DMBTR * currency_decimal.CURRFIX, ekbe.DMBTR) AS AmountInLocalCurrency_DMBTR,
  COALESCE(ekbe.WRBTR * currency_decimal.CURRFIX, ekbe.WRBTR) AS AmountInDocumentCurrency_WRBTR
FROM
  `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.ekbe` AS ekbe
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.currency_decimal` AS currency_decimal
  ON ekbe.WAERS = currency_decimal.CURRKEY
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.calendar_date_dim` AS CalendarDateDimension_BUDAT
  ON CalendarDateDimension_BUDAT.Date = ekbe.BUDAT
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_ecc }}.calendar_date_dim` AS CalendarDateDimension_BLDAT
  ON CalendarDateDimension_BLDAT.Date = ekbe.BLDAT
--vgabe='1' for Goods Receipt and vgabe='2' for Invoice Receipt
WHERE ekbe.VGABE IN ('1', '2')
