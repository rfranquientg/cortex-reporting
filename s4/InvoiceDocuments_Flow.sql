WITH
  -- Subquery to flip debit/credit in to positive/negative
  RSEG AS (
    SELECT
      * EXCEPT (wrbtr, bnkan),
      CASE
        WHEN shkzg = 'S' THEN 'debit'
        WHEN shkzg = 'H' THEN 'credit'
      END AS dr_cr_flag,
      CASE
        WHEN shkzg = 'S' THEN wrbtr  -- S = Debit | Amount in document currency
        WHEN shkzg = 'H' THEN wrbtr * -1  -- H = Credit | Amount in document currency
        ELSE wrbtr
      END AS wrbtr,
      CASE
        WHEN shkzg = 'S' THEN bnkan  -- S = Debit | Delivery Cost Share of Item Value
        WHEN shkzg = 'H' THEN bnkan * -1  -- H = Credit | Delivery Cost Share of Item Value
        ELSE bnkan
      END AS bnkan
    FROM
      `{{ project_id_src }}.{{ dataset_cdc_processed_s4 }}.rseg`
  ),

  -- Subquery to flip debit/credit in to positive/negative
  RBCO AS (
    SELECT
      * EXCEPT (wrbtr, bnkan_fw),
      CASE
        WHEN shkzg = 'S' THEN 'debit'
        WHEN shkzg = 'H' THEN 'credit'
      END AS dr_cr_flag,
      CASE
        WHEN shkzg = 'S' THEN wrbtr  -- Debit | Amount in document currency
        WHEN shkzg = 'H' THEN wrbtr * -1  -- Credit | Amount in document currency
        ELSE wrbtr
      END AS wrbtr,
      CASE
        WHEN shkzg = 'S' THEN bnkan_fw  -- Debit | Delivery Cost Share of Item Value
        WHEN shkzg = 'H' THEN bnkan_fw * -1  -- Credit | Delivery Cost Share of Item Value
        ELSE bnkan_fw
      END AS bnkan_fw
    FROM
      `{{ project_id_src }}.{{ dataset_cdc_processed_s4 }}.rbco`
  ),

  RSEG_RBCO AS (
    SELECT
      RBCO.cobl_nr,
      RSEG.ebeln,
      RSEG.ebelp,
      RSEG.matnr,
      RSEG.bwkey,
      RSEG.bwtar,
      RSEG.bstme,
      RSEG.bprme,
      RSEG.lbkum,
      RSEG.vrkum,
      RSEG.pstyp,
      RSEG.knttp,
      RSEG.bklas,
      RSEG.erekz,
      RSEG.exkbe,
      RSEG.xekbz,
      RSEG.tbtkz,
      RSEG.spgrp,
      RSEG.spgrm,
      RSEG.spgrt,
      RSEG.spgrg,
      RSEG.spgrv,
      RSEG.spgrq,
      RSEG.spgrc,
      RSEG.spgrext,
      RSEG.bustw,
      RSEG.xblnr,
      RSEG.xrueb,
      RSEG.bnkan,
      RSEG.kschl,
      RSEG.salk3,
      RSEG.vmsal,
      RSEG.xlifo,
      RSEG.lfbnr,
      RSEG.lfgja,
      RSEG.lfpos,
      RSEG.matbf,
      RSEG.rbmng,
      RSEG.bprbm,
      RSEG.rbwwr,
      RSEG.lfehl,
      RSEG.gricd,
      RSEG.grirg,
      RSEG.gityp,
      RSEG.packno,
      RSEG.introw,
      RSEG.kzmek,
      RSEG.mrmok,
      RSEG.stunr,
      RSEG.zaehk,
      RSEG.stock_posting,
      RSEG.stock_posting_pp,
      RSEG.stock_posting_py,
      RSEG.werec,
      RSEG.lifnr,
      RSEG.frbnr,
      RSEG.xhistma,
      RSEG.complaint_reason,
      RSEG.retamt_fc,
      RSEG.retpc,
      RSEG.retduedt,
      RSEG.xrettaxnet,
      RSEG.re_account,
      RSEG.erp_contract_id,
      RSEG.erp_contract_itm,
      RSEG.srm_contract_id,
      RSEG.srm_contract_itm,
      RSEG.cont_pstyp,
      RSEG.srvmapkey,
      RSEG.charg,
      RSEG.inv_itm_origin,
      RSEG.invrel,
      RSEG.xdinv,
      RSEG.diff_amount,
      RSEG.xcprf,
      RSEG.fsh_season_year,
      RSEG.fsh_season,
      RSEG.fsh_collection,
      RSEG.fsh_theme,
      RSEG.licno,
      RSEG.zeile,
      RSEG.sgt_scat,
      RSEG.wrf_charstc1,
      RSEG.wrf_charstc2,
      RSEG.wrf_charstc3,
      RBCO.anln1,
      RBCO.anln2,
      RBCO.aplzl,
      RBCO.aufnr,
      RBCO.dabrz,
      RBCO.fipos,
      RBCO.fistl,
      RBCO.fkber,
      RBCO.geber,
      RBCO.grant_nbr,
      RBCO.gsber,
      RBCO.imkey,
      RBCO.kokrs,
      RBCO.kostl,
      RBCO.kstrg,
      RBCO.paobjnr,
      RBCO.prctr,
      RBCO.ps_psp_pnr,
      RBCO.recid,
      RBCO.saknr,
      RBCO.vbeln,
      RBCO.vbelp,
      RBCO.vptnr,
      -- RBCO.zzspreg,
      -- RBCO.zzbuspartn,
      -- RBCO.zzproduct,
      -- RBCO.zzloca,
      -- RBCO.zzchan,
      -- RBCO.zzlob,
      -- RBCO.zznfal,
      -- RBCO.zzuserfld1,
      -- RBCO.zzuserfld2,
      -- RBCO.zzuserfld3,
      -- RBCO.zzregion,
      -- RBCO.zzstate,
      RBCO.xunpl,
      RBCO.lstar,
      RBCO.prznr,
      RBCO.aufpl,
      RBCO.bzdat,
      RBCO.bnkan_fw,
      RBCO.xnegp,
      RBCO.erlkz,
      RBCO.fikrs,
      RBCO.kblnr,
      RBCO.kblpos,
      RBCO.pargb,
      RBCO.pernr,
      RBCO.nplnr,
      RBCO.vornr,
      RBCO.zuonr,
      RBCO.mwart,
      RBCO.fwbas,
      RBCO.hwbas,
      RBCO.abper,
      RBCO.ledat,
      RBCO.menge_f,
      RBCO.bpmng_f,
      RBCO.budget_pd,
      RBCO.measure,
      RBCO.fmfgus_key,
      RBCO.koart,
      RBCO.aa_final_ind,
      RBCO.aa_final_qty,
      RBCO.aa_final_qty_f,
      RBCO.parked_qty,
      RBCO.parked_qty_f,
      COALESCE(RSEG.mandt, RBCO.mandt) AS mandt,
      COALESCE(RSEG.belnr, RBCO.belnr) AS belnr,
      COALESCE(RSEG.gjahr, RBCO.gjahr) AS gjahr,
      COALESCE(RSEG.buzei, RBCO.buzei) AS buzei,
      COALESCE(RSEG.zekkn, RBCO.zekkn) AS zekkn,
      COALESCE(RSEG.bukrs, RBCO.bukrs) AS bukrs,
      COALESCE(RSEG.werks, RBCO.werks) AS werks,
      COALESCE(RSEG.wrbtr, RBCO.wrbtr) AS wrbtr,
      COALESCE(RSEG.shkzg, RBCO.shkzg) AS shkzg,
      COALESCE(RSEG.mwskz, RBCO.mwskz) AS mwskz,
      COALESCE(RSEG.txjcd, RBCO.txjcd) AS txjcd,
      COALESCE(RSEG.menge, RBCO.menge) AS menge,
      COALESCE(RSEG.bpmng, RBCO.bpmng) AS bpmng,
      COALESCE(RSEG.meins, RBCO.meins) AS meins,
      COALESCE(RSEG.spgrs, RBCO.spgrs) AS spgrs,
      COALESCE(RSEG.sgtxt, RBCO.sgtxt) AS sgtxt,
      COALESCE(RSEG.xskrl, RBCO.xskrl) AS xskrl
    FROM
      RSEG
    FULL OUTER JOIN
      RBCO
      ON
        RSEG.mandt = RBCO.mandt
        AND RSEG.belnr = RBCO.belnr
        AND RSEG.gjahr = RBCO.gjahr
        AND RSEG.buzei = RBCO.buzei
  )

SELECT
  -- Primary Key
  RBKP.mandt AS Client_MANDT,
  RBKP.gjahr AS FiscalYear_GJAHR,
  RBKP.belnr AS InvoiceDocNum_BELNR,
  RSEG_RBCO.buzei AS InvoiceDocLineNum_BUZEI,
  RSEG_RBCO.cobl_nr AS InvoiceDocAssignmentNum_COBL_NR,
  RBKP.blart AS Documenttype_BLART,
  RBKP.bldat AS DocumentDate_BLDAT,
  RBKP.budat AS PostingDate_BUDAT,
  RBKP.usnam AS UserName_USNAM,
  RBKP.tcode AS TransactionCode_TCODE,
  RBKP.cpudt AS EnteredOn_CPUDT,
  RBKP.cputm AS Enteredat_CPUTM,
  RBKP.vgart AS TransactnType_VGART,
  RBKP.xblnr AS Reference_XBLNR,
  RBKP.lifnr AS InvoicingParty_LIFNR,
  RBKP.waers AS Currency_WAERS,
  RBKP.kursf AS Exchangerate_KURSF,
  RBKP.rmwwr AS GrossInvAmnt_RMWWR,
  RBKP.beznk AS UnplDelCsts_BEZNK,
  RBKP.wmwst1 AS ValueAddedTax_WMWST1,
  RBKP.mwskz1 AS TaxCode_MWSKZ1,
  RBKP.wmwst2 AS notinuse_WMWST2,
  RBKP.mwskz2 AS notinuse_MWSKZ2,
  RBKP.zterm AS Paytterms_ZTERM,
  RBKP.zbd1t AS Days1_ZBD1T,
  RBKP.zbd1p AS Discpercent1_ZBD1P,
  RBKP.zbd2t AS Days2_ZBD2T,
  RBKP.zbd2p AS Discpercent2_ZBD2P,
  RBKP.zbd3t AS DaysNet_ZBD3T,
  RBKP.wskto AS CDAmount_WSKTO,
  RBKP.xrech AS Invoice_XRECH,
  RBKP.bktxt AS DocHeaderText_BKTXT,
  RBKP.saprl AS SAPRelease_SAPRL,
  RBKP.logsys AS Logicalsystem_LOGSYS,
  RBKP.xmwst AS CalculateTax_XMWST,
  RBKP.stblg AS Reversedby_STBLG,
  RBKP.stjah AS Year_STJAH,
  RBKP.mwskz_bnk AS TaxCode_MWSKZ_BNK,
  RBKP.txjcd_bnk AS TaxJur_TXJCD_BNK,
  RBKP.ivtyp AS IVcategory_IVTYP,
  RBKP.xrbtx AS Sevtaxcodes_XRBTX,
  RBKP.repart AS InvVerType_REPART,
  RBKP.rbstat AS Invstatus_RBSTAT,
  RBKP.knumve AS DocCondition_KNUMVE,
  RBKP.knumvl AS SupplierCond_KNUMVL,
  RBKP.arkuen AS Invreduction_ARKUEN,
  RBKP.arkuemw AS TaxInvRed_ARKUEMW,
  RBKP.makzn AS ManAccpdNetAmnt_MAKZN,
  RBKP.makzmw AS Taxaccptdman_MAKZMW,
  RBKP.lieffn AS SuppErrornet_LIEFFN,
  RBKP.lieffmw AS TaxSuppError_LIEFFMW,
  RBKP.xautakz AS Autoaccepted_XAUTAKZ,
  RBKP.esrnr AS ISRnumber_ESRNR,
  RBKP.esrpz AS Checkdigit_ESRPZ,
  RBKP.esrre AS ISRQRRef_ESRRE,
  RBKP.qsshb AS WTaxBase_QSSHB,
  RBKP.qsfbt AS WTaxExempt_QSFBT,
  RBKP.qsskz AS WTaxCode_QSSKZ,
  RBKP.diekz AS ServiceInd_DIEKZ,
  RBKP.landl AS SupplCntry_LANDL,
  RBKP.lzbkz AS SCBInd_LZBKZ,
  RBKP.txkrs AS RateforTaxes_TXKRS,
  RBKP.ctxkrs AS TaxRateLC_CTXKRS,
  RBKP.empfb AS Payer_EMPFB,
  RBKP.bvtyp AS Partbanktype_BVTYP,
  RBKP.hbkid AS Housebank_HBKID,
  RBKP.zuonr AS Assignment_ZUONR,
  RBKP.zlspr AS Pmntblock_ZLSPR,
  RBKP.zlsch AS PymtMeth_ZLSCH,
  RBKP.zfbdt AS BaselineDate_ZFBDT,
  RBKP.kidno AS PaymentRef_KIDNO,
  RBKP.rebzg AS InRRefno_REBZG,
  RBKP.rebzj AS FiscalYear_REBZJ,
  RBKP.xinve AS InvestID_XINVE,
  RBKP.egmld AS ReportingCntry_EGMLD,
  RBKP.xegdr AS EUTriangDeal_XEGDR,
  RBKP.vatdate AS TaxReportingDate_VATDATE,
  RBKP.hkont AS GLAcct_HKONT,
  RBKP.j_1bnftype AS NFtype_J_1BNFTYPE,
  RBKP.brnch AS Branchnumber_BRNCH,
  RBKP.erfpr AS EntryProfile_ERFPR,
  RBKP.secco AS SectionCode_SECCO,
  RBKP.name1 AS Name_NAME1,
  RBKP.name2 AS Name2_NAME2,
  RBKP.name3 AS Name3_NAME3,
  RBKP.name4 AS Name4_NAME4,
  RBKP.pstlz AS PostalCode_PSTLZ,
  RBKP.ort01 AS City_ORT01,
  RBKP.land1 AS Country_LAND1,
  RBKP.stras AS Street_STRAS,
  RBKP.pfach AS POBox_PFACH,
  RBKP.pstl2 AS POBoxPCode_PSTL2,
  RBKP.pskto AS Postbankno_PSKTO,
  RBKP.bankn AS BankAccount_BANKN,
  RBKP.bankl AS Banknumber_BANKL,
  RBKP.banks AS BankCountry_BANKS,
  RBKP.stcd1 AS TaxNumber1_STCD1,
  RBKP.stcd2 AS TaxNumber2_STCD2,
  RBKP.stkzu AS LiableforVAT_STKZU,
  RBKP.stkza AS Equalizatntax_STKZA,
  RBKP.regio AS Region_REGIO,
  RBKP.bkont AS Controlkey_BKONT,
  RBKP.dtaws AS Instructionkey_DTAWS,
  RBKP.dtams AS DMEindicator_DTAMS,
  RBKP.spras AS CHAR1_SPRAS,
  RBKP.xcpdk AS Onetimeacct_XCPDK,
  RBKP.empfg AS Pmntrecipient_EMPFG,
  RBKP.fityp AS Taxtype_FITYP,
  RBKP.stcdt AS Taxnumbertype_STCDT,
  RBKP.stkzn AS Naturalperson_STKZN,
  RBKP.stcd3 AS TaxNumber3_STCD3,
  RBKP.stcd4 AS TaxNumber4_STCD4,
  RBKP.bkref AS Reference_BKREF,
  RBKP.j_1kfrepre AS RepsName_J_1KFREPRE,
  RBKP.j_1kftbus AS TypeofBusiness_J_1KFTBUS,
  RBKP.j_1kftind AS TypeofIndustry_J_1KFTIND,
  RBKP.anred AS Title_ANRED,
  RBKP.stceg AS VATRegNo_STCEG,
  RBKP.ername AS Createdby_ERNAME,
  RBKP.reindat AS Invrecptdate_REINDAT,
  RBKP.uzawe AS Pmtmethsupl_UZAWE,
  RBKP.fdlev AS PlanningLevel_FDLEV,
  RBKP.fdtag AS PlanningDate_FDTAG,
  RBKP.zbfix AS Fixed_ZBFIX,
  RBKP.frgkz AS ReleaseInd_FRGKZ,
  RBKP.erfnam AS EnteredBy_ERFNAM,
  RBKP.bupla AS Businessplace_BUPLA,
  RBKP.filkd AS Branch_FILKD,
  RBKP.lotkz AS LotNo_LOTKZ,
  RBKP.sgtxt AS Text_SGTXT,
  RBKP.inv_tran AS Transaction_INV_TRAN,
  RBKP.prepay_status AS PrepaymentStatus_PREPAY_STATUS,
  RBKP.prepay_awkey AS InvoiceNumber_PREPAY_AWKEY,
  RBKP.assign_status AS AssignmTest_ASSIGN_STATUS,
  RBKP.assign_next_date AS NextAssignment_ASSIGN_NEXT_DATE,
  RBKP.assign_end_date AS AssignmentEnd_ASSIGN_END_DATE,
  RBKP.copy_by_belnr AS OriginalInvoice_COPY_BY_BELNR,
  RBKP.copy_by_year AS FiscalYear_COPY_BY_YEAR,
  RBKP.copy_to_belnr AS CopiedInvoice_COPY_TO_BELNR,
  RBKP.copy_to_year AS FYearInvCopy_COPY_TO_YEAR,
  RBKP.copy_user AS CreatorofCopy_COPY_USER,
  RBKP.kursx AS ExchangeRate_KURSX,
  RBKP.wwert AS Translationdte_WWERT,
  RBKP.xref3 AS Referencekey3_XREF3,
  RBKP.j_1tpbupl AS BranchCode_J_1TPBUPL,
  RSEG_RBCO.ebeln AS PoNum_EBELN,
  RSEG_RBCO.ebelp AS PoLineNum_EBELP,
  RSEG_RBCO.zekkn AS PoAssignmentNum_ZEKKN,
  RSEG_RBCO.matnr AS MaterialNumber_MATNR,
  RSEG_RBCO.bwkey AS ValuationArea_BWKEY,
  RSEG_RBCO.bwtar AS ValuationType_BWTAR,
  RSEG_RBCO.bstme AS PoUOM_BSTME,
  RSEG_RBCO.bprme AS OrderPriceUnit_BPRME,
  RSEG_RBCO.lbkum AS TotalValuatedStock_LBKUM,
  RSEG_RBCO.vrkum AS TotalValuatedStockPreviousPeriod_VRKUM,
  RSEG_RBCO.pstyp AS PoItemCategory_PSTYP,
  RSEG_RBCO.knttp AS AccountAssignmentCategory_KNTTP,
  RSEG_RBCO.bklas AS ValuationClass_BKLAS,
  RSEG_RBCO.erekz AS IndicatorFinalInvoice_EREKZ,
  RSEG_RBCO.exkbe AS IndicatorUpdateEKBE_EXKBE,
  RSEG_RBCO.xekbz AS IndicatorUpdatePurchaseOrderDeliveryCosts_XEKBZ,
  RSEG_RBCO.tbtkz AS IndicatorSubsequentDebitCredit_TBTKZ,
  RSEG_RBCO.spgrp AS BlockingReasonPrice_SPGRP,
  RSEG_RBCO.spgrm AS BlockingReasonQuantity_SPGRM,
  RSEG_RBCO.spgrt AS BlockingReasonDate_SPGRT,
  RSEG_RBCO.spgrg AS BlockingReasonOrderPriceQuantity_SPGRG,
  RSEG_RBCO.spgrv AS BlockingReasonProjectBudget_SPGRV,
  RSEG_RBCO.spgrq AS ManualBlockingReason_SPGRQ,
  RSEG_RBCO.spgrc AS BlockingReasonQuality_SPGRC,
  RSEG_RBCO.spgrext AS BlockingReasonEnhancementFields_SPGREXT,
  RSEG_RBCO.bustw AS PostingStringforValues_BUSTW,
  RSEG_RBCO.xblnr AS ReferenceDocumentNumber_XBLNR,
  RSEG_RBCO.xrueb AS IndicatorDocumentIsPostedPreviousPeriod_XRUEB,
  RSEG_RBCO.bnkan AS DeliveryCostsItemSplit_BNKAN,
  RSEG_RBCO.kschl AS Conditiontype_KSCHL,
  RSEG_RBCO.salk3 AS TotalValuatedStockValue_SALK3,
  RSEG_RBCO.vmsal AS TotalValuatedStockPreviousPeriodValue_VMSAL,
  RSEG_RBCO.xlifo AS LIFOFIFO_XLIFO,
  RSEG_RBCO.lfbnr AS ReferenceDoc_LFBNR,
  RSEG_RBCO.lfgja AS FiscalYearofCurrentPeriod_LFGJA,
  RSEG_RBCO.lfpos AS ReferenceDocLineNum_LFPOS,
  RSEG_RBCO.matbf AS MaterialinRespectofWhichStockisManaged_MATBF,
  RSEG_RBCO.rbmng AS QuantityInvoicedinSupplierInvoiceinPOOrderUnits_RBMNG,
  RSEG_RBCO.bprbm AS QuantityInvoicedinSupplierInvoiceinPOPriceUnits_BPRBM,
  RSEG_RBCO.lfehl AS TypeofSupplierError_LFEHL,
  RSEG_RBCO.gricd AS GrossIncomeTaxActivityCode_GRICD,
  RSEG_RBCO.grirg AS Region_GRIRG,
  RSEG_RBCO.gityp AS DistributionTypeforEmploymentTax_GITYP,
  RSEG_RBCO.packno AS PackageNumberofService_PACKNO,
  RSEG_RBCO.introw AS LineNumberofService_INTROW,
  RSEG_RBCO.kzmek AS Correctionindicator_KZMEK,
  RSEG_RBCO.mrmok AS IndicatorInvoiceItemProcessed_MRMOK,
  RSEG_RBCO.stunr AS StepNumber_STUNR,
  RSEG_RBCO.zaehk AS ConditionCounter_ZAEHK,
  RSEG_RBCO.stock_posting AS StockPostingofLinefromanIncomingInvoice_STOCK_POSTING,
  RSEG_RBCO.stock_posting_pp AS StockPostingPrevPeriod_STOCK_POSTING_PP,
  RSEG_RBCO.stock_posting_py AS StockPostingPrevYear_STOCK_POSTING_PY,
  RSEG_RBCO.werec AS ClearingIndicatorGRIRPosting_WEREC,
  RSEG_RBCO.lifnr AS AccountNumber_LIFNR,
  RSEG_RBCO.frbnr AS BillOfLading_FRBNR,
  RSEG_RBCO.xhistma AS UpdateMultipleAccountAssignment_XHISTMA,
  RSEG_RBCO.complaint_reason AS ComplaintsReason_COMPLAINT_REASON,
  RSEG_RBCO.retpc AS RetentionPercent_RETPC,
  RSEG_RBCO.retduedt AS RetentionDueDate_RETDUEDT,
  RSEG_RBCO.xrettaxnet AS RetentionTaxReduction_XRETTAXNET,
  RSEG_RBCO.re_account AS CashLedgerAccount_RE_ACCOUNT,
  RSEG_RBCO.erp_contract_id AS PrincipalPurchaseAgreementNum_ERP_CONTRACT_ID,
  RSEG_RBCO.erp_contract_itm AS PrincipalPurchaseAgreementItemNum_ERP_CONTRACT_ITM,
  RSEG_RBCO.srm_contract_id AS CentralContractNum_SRM_CONTRACT_ID,
  RSEG_RBCO.srm_contract_itm AS CentralContractItemNumber_SRM_CONTRACT_ITM,
  RSEG_RBCO.cont_pstyp AS PoItemCategory2_CONT_PSTYP,
  RSEG_RBCO.srvmapkey AS eSOAKey_SRVMAPKEY,
  RSEG_RBCO.charg AS BatchNumber_CHARG,
  RSEG_RBCO.inv_itm_origin AS InvoiceItemOrigin_INV_ITM_ORIGIN,
  RSEG_RBCO.invrel AS GroupingCharacteristic_INVREL,
  RSEG_RBCO.xdinv AS IndicatorInvoicingDifferential_XDINV,
  RSEG_RBCO.xcprf AS IndicatorCommodityRepricing_XCPRF,
  RSEG_RBCO.fsh_season_year AS SeasonYear_FSH_SEASON_YEAR,
  RSEG_RBCO.fsh_season AS Season_FSH_SEASON,
  RSEG_RBCO.fsh_collection AS FashionCollection_FSH_COLLECTION,
  RSEG_RBCO.fsh_theme AS FashionTheme_FSH_THEME,
  RSEG_RBCO.licno AS InternalLicenseNumber_LICNO,
  RSEG_RBCO.zeile AS ItemNumber_ZEILE,
  RSEG_RBCO.sgt_scat AS StockSegment_SGT_SCAT,
  RSEG_RBCO.wrf_charstc1 AS CharacteristicValue1_WRF_CHARSTC1,
  RSEG_RBCO.wrf_charstc2 AS CharacteristicValue2_WRF_CHARSTC2,
  RSEG_RBCO.wrf_charstc3 AS CharacteristicValue3_WRF_CHARSTC3,
  RSEG_RBCO.anln1 AS MainAssetNumber_ANLN1,
  RSEG_RBCO.anln2 AS AssetSubnumber_ANLN2,
  RSEG_RBCO.aplzl AS RoutingNumber_APLZL,
  RSEG_RBCO.aufnr AS OrderNumber_AUFNR,
  RSEG_RBCO.dabrz AS SettlementReferenceDate_DABRZ,
  RSEG_RBCO.fipos AS CommitmentItem_FIPOS,
  RSEG_RBCO.fistl AS FundsCenter_FISTL,
  RSEG_RBCO.fkber AS FunctionalArea_FKBER,
  RSEG_RBCO.geber AS Fund_GEBER,
  RSEG_RBCO.grant_nbr AS Grant_GRANT_NBR,
  RSEG_RBCO.imkey AS RealEstateObjectKey_IMKEY,
  RSEG_RBCO.kokrs AS ControllingArea_KOKRS,
  RSEG_RBCO.kostl AS CostCenter_KOSTL,
  RSEG_RBCO.kstrg AS CostObject_KSTRG,
  RSEG_RBCO.paobjnr AS ProfitabilitySegmentNumber_PAOBJNR,
  RSEG_RBCO.prctr AS ProfitCenter_PRCTR,
  RSEG_RBCO.ps_psp_pnr AS WbsElement_PS_PSP_PNR,
  RSEG_RBCO.recid AS RulesforIssuinganInvoice_RECID,
  RSEG_RBCO.saknr AS GlAccount_SAKNR,
  RSEG_RBCO.vbeln AS SalesDocNum_VBELN,
  RSEG_RBCO.vbelp AS SalesDocLineNum_VBELP,
  RSEG_RBCO.vptnr AS PartnerAccountNum_VPTNR,
  RSEG_RBCO.xunpl AS UnplannedAccountAssignment_XUNPL,
  RSEG_RBCO.lstar AS ActivityType_LSTAR,
  RSEG_RBCO.prznr AS BusinessProcess_PRZNR,
  RSEG_RBCO.aufpl AS Routingnumberofoperationsintheorder_AUFPL,
  RSEG_RBCO.bzdat AS AssetValueDate_BZDAT,
  RSEG_RBCO.xnegp AS IndicatorNegativePosting_XNEGP,
  RSEG_RBCO.erlkz AS UsedEarmarkedFunds_ERLKZ,
  RSEG_RBCO.fikrs AS FinancialManagementArea_FIKRS,
  RSEG_RBCO.kblnr AS EarmarkedFundsDocumentNum_KBLNR,
  RSEG_RBCO.kblpos AS EarmarkedFundsDocumentItemNum_KBLPOS,
  RSEG_RBCO.pargb AS Tradingpartner_PARGB,
  RSEG_RBCO.pernr AS PersonnelNumber_PERNR,
  RSEG_RBCO.nplnr AS NetworkNumberAccountAssignment_NPLNR,
  RSEG_RBCO.vornr AS OperationActivityNumber_VORNR,
  RSEG_RBCO.zuonr AS Assignmentnumber_ZUONR,
  RSEG_RBCO.mwart AS TaxType_MWART,
  RSEG_RBCO.hwbas AS TaxBaseLocalCurrencyAmount_HWBAS,
  RSEG_RBCO.abper AS SettlementPeriod_ABPER,
  RSEG_RBCO.ledat AS DeliveryCreationDate_LEDAT,
  RSEG_RBCO.menge_f AS Quantity_MENGE_F,
  RSEG_RBCO.bpmng_f AS QuantityPOPriceUnit_BPMNG_F,
  RSEG_RBCO.budget_pd AS BudgetPeriod_BUDGET_PD,
  RSEG_RBCO.measure AS FundedProgram_MEASURE,
  RSEG_RBCO.fmfgus_key AS UnitedStatesFederalGovernmentFields_FMFGUS_KEY,
  RSEG_RBCO.koart AS Accounttype_KOART,
  RSEG_RBCO.aa_final_ind AS FinalAccountAssignmentIndicator_AA_FINAL_IND,
  RSEG_RBCO.aa_final_qty AS FinalAccountAssignmentQuantity_AA_FINAL_QTY,
  RSEG_RBCO.aa_final_qty_f AS FinalAccountAssignmentQuantityFloat_AA_FINAL_QTY_F,
  RSEG_RBCO.parked_qty AS ParkedInvoiceQuantity_PARKED_QTY,
  RSEG_RBCO.parked_qty_f AS ParkedInvoiceQuantityFloat_PARKED_QTY_F,
  RSEG_RBCO.werks AS Plant_WERKS,
  RSEG_RBCO.shkzg AS DebitCreditIndicator_SHKZG,
  RSEG_RBCO.mwskz AS Taxonsalespurchasescode_MWSKZ,
  RSEG_RBCO.txjcd AS TaxJurisdiction_TXJCD,
  RSEG_RBCO.menge AS Quantity_MENGE,
  RSEG_RBCO.bpmng AS QuantityinPurchaseOrderPriceUnit_BPMNG,
  RSEG_RBCO.meins AS BaseUnitofMeasure_MEINS,
  RSEG_RBCO.spgrs AS BlockingReasonItemAmount_SPGRS,
  RSEG_RBCO.sgtxt AS ItemText_SGTXT,
  RSEG_RBCO.xskrl AS IndicatorLineItemCashDiscountNotLiable_XSKRL,
  --##CORTEX-CUSTOMER Consider adding other dimensions from the calendar_date_dim table as per your requirement
  CalendarDateDimension_BUDAT.CalYear AS YearOfPostingDate_BUDAT,
  CalendarDateDimension_BUDAT.CalMonth AS MonthOfPostingDate_BUDAT,
  CalendarDateDimension_BUDAT.CalWeek AS WeekOfPostingDate_BUDAT,
  CalendarDateDimension_BUDAT.CalQuarter AS QuarterOfPostingDate_BUDAT,
  CalendarDateDimension_BLDAT.CalYear AS YearOfDocumentDate_BLDAT,
  CalendarDateDimension_BLDAT.CalMonth AS MonthOfDocumentDate_BLDAT,
  CalendarDateDimension_BLDAT.CalWeek AS WeekOfDocumentDate_BLDAT,
  CalendarDateDimension_BLDAT.CalQuarter AS QuarterOfDocumentDate_BLDAT,
  CAST(NULL AS STRING) AS WbsElement_POSID,
  COALESCE(RBKP.bukrs, RSEG_RBCO.bukrs) AS CompanyCode_BUKRS,
  COALESCE(RBKP.gsber, RSEG_RBCO.gsber) AS BusinessArea_GSBER,
  COALESCE(RSEG_RBCO.rbwwr * TCURX_WAER.currfix, RSEG_RBCO.rbwwr) AS InvoiceAmountinDocumentCurrencyofSupplierInvoice_RBWWR,
  COALESCE(RSEG_RBCO.retamt_fc * TCURX_WAER.currfix, RSEG_RBCO.retamt_fc) AS RetentionAmount_RETAMT_FC,
  COALESCE(RSEG_RBCO.diff_amount * TCURX_WAER.currfix, RSEG_RBCO.diff_amount) AS DifferenceAmount_DIFF_AMOUNT,
  COALESCE(RSEG_RBCO.bnkan_fw * TCURX_WAER.currfix, RSEG_RBCO.bnkan_fw) AS DeliveryCostsDistributionAmount_BNKAN_FW,
  COALESCE(RSEG_RBCO.fwbas * TCURX_WAER.currfix, RSEG_RBCO.fwbas) AS TaxBaseAmount_FWBAS,
  COALESCE(RSEG_RBCO.wrbtr * TCURX_WAER.currfix, RSEG_RBCO.wrbtr) AS AmountinDocumentCurrency_WRBTR
FROM RSEG_RBCO
INNER JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_s4 }}.rbkp` AS RBKP
  ON RSEG_RBCO.mandt = RBKP.mandt
    AND RSEG_RBCO.belnr = RBKP.belnr
    AND RSEG_RBCO.gjahr = RBKP.gjahr
-- Joining to this table(currency_decimal) is necesssary to fix the decimal place of
-- amounts for non-decimal-based currencies. SAP stores these amounts
-- offset by a factor  of 1/100 within the system (FYI this gets
-- corrected when a user observes these in the GUI) Currencies w/
-- decimals are unimpacted.
-- Example of impacted currencies JPY, IDR, KRW, TWD
-- Example of non-impacted currencies USD, GBP, EUR
-- Example 1,000 JPY will appear as 10.00 JPY
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_s4 }}.currency_decimal` AS TCURX_WAER
  ON RBKP.waers = TCURX_WAER.currkey
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_s4 }}.calendar_date_dim` AS CalendarDateDimension_BUDAT
  ON CalendarDateDimension_BUDAT.Date = RBKP.budat
LEFT JOIN `{{ project_id_src }}.{{ dataset_cdc_processed_s4 }}.calendar_date_dim` AS CalendarDateDimension_BLDAT
  ON CalendarDateDimension_BLDAT.Date = RBKP.bldat
