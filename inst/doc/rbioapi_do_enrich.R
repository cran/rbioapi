## ---- include = FALSE, setup, echo=FALSE, results="hide"----------------------
knitr::opts_chunk$set(echo = TRUE,
                      eval = TRUE,
                      message = FALSE,
                      warning = FALSE,
                      collapse = TRUE,
                      tidy = FALSE,
                      cache = FALSE,
                      dev = "png",
                      comment = "#>")
library(rbioapi)
rba_options(timeout = 600, skip_error = TRUE)

## ----define var, echo=TRUE, message=TRUE--------------------------------------
covid_critical <- c("TXNDC5", "GABRR2", "MGAM2", "LOC200772", "LYPD2", "IFI27", "RPH3A", "OTOF", "NBPF8", "CLEC4F", "CNGB1", "HIST1H2BF", "HIF1A", "SDC1", "TUBB8", "FBXO39", "TPSB2", "CD177", "LRRN3", "EBLN2", "PCSK9", "ELK2AP", "UCHL1", "C22orf15", "LPO", "C3orf20", "CLRN1-AS1", "GPR75", "CA12", "RAB19", "CHRFAM7A", "CRYGN", "DLGAP5", "BTBD8", "LOC100272216", "PRG3", "CYP46A1", "LOC102723604", "PPAP2B", "C4BPA", "SPESP1", "LILRP2", "UBE2Q1-AS1", "MIR3945", "NOMO3", "MEG3", "LOC400927-CSNK1E", "MIR6732", "MIR590", "PPP1R3G", "PYCR1", "ARHGAP42", "MMP8", "HMMR", "P3H2", "ACER1", "NOG", "RAB39A", "ANTXRLP1", "LINC00266-3", "GPRC5D", "MCM10", "TSPY26P", "ANKRD36BP1", "GBP1P1", "PRL", "CYP1A1", "KIF4A", "LOC102724323", "SERPINB10", "GSTA4", "TRIM51", "MIXL1", "RNASE1", "CASC8", "MAOA", "XCL1", "ADAMTS2", "LOC101929125", "DCANP1", "BHLHA15", "ANOS1", "SLC18A1", "CCDC150", "CAV1", "SH3BP5", "LINC00398", "NCOA2", "SPATC1", "SHROOM2", "GPR27", "LRRC26", "RNF169", "USP3-AS1", "VWA7", "ROCK2", "FSTL4", "METTL7B", "CYP4F29P", "LEF1-AS1", "HORMAD2-AS1", "FBXO15", "PPTC7", "TYMS", "PPP4R2", "ZNF608", "FAM46B", "PCSK1N", "LINC00623", "CASC5", "ZNF224", "DENND2C", "WDR86", "PTGR1", "SPATA3-AS1", "LOC101927412", "KIF14", "MMP28", "PBK", "VMO1", "ADCY3", "HIST1H2BO", "FTO-IT1", "MIR342", "FANK1", "CRIP2", "TIAF1", "LOC344887", "OLFM4", "MKNK1-AS1", "ZDHHC19", "SEPT14", "EPSTI1", "FOXC1", "MIR616", "KRT72", "LINC01347", "LOC101928100", "KIAA0895", "BOK", "HIST1H2AI", "DBH-AS1", "ADORA2A-AS1", "MED12L", "SAMD15", "TARM1", "SMTNL1", "POU5F1P3", "LINC00968", "OAS3", "LOC103091866", "SH3RF3-AS1", "NBPF10", "APAF1", "SLC2A14", "SYT17", "ETV3", "SHROOM4", "AOAH-IT1", "NAIP", "ALAS2", "GLIS3", "ADAM17", "OLFM1", "PCAT29", "TNFRSF18", "DNASE1L3", "IGF2BP3", "LINC01271", "AP3B2", "TXNDC2", "CEP55", "SIGLEC1", "RAB3IL1", "PLD4", "KIFC1", "LINC00487", "ABHD12B", "ITGA7", "GJB6", "CARD14", "LRRN2", "MPO", "KLRC3", "LOC100507487", "SCGB3A1", "CD38", "LRRN1", "SYCP2L", "ANLN", "ASPM", "OAS1", "IFI44L", "CDCA3", "HLA-DQB2", "ANO9", "NUDT11", "HMP19", "DEPDC1", "GPR84", "PLEKHF1", "PI16", "RDH5", "TMED8", "LINC00824", "SEPT4", "CLIC3", "B4GALNT3", "OLAH", "ITGA1", "FOXI1", "LOC100506142", "CDC20", "HAGHL", "GTSCR1", "B3GALNT1", "SOCS3", "PCDH1", "TAS2R20", "CDC25A", "NPDC1", "LOC100505915", "XCL2", "TIAM2", "LOC100288069", "IL34", "IL18R1", "CYYR1", "ZNF888", "FAM20A", "MDS2", "ABCA13", "KCNJ1", "SLC4A9", "EXO1", "LAIR2", "IQSEC3", "SCT", "SLC26A8", "ESCO2", "ZDHHC1", "SNORA63", "FBLN5", "PRUNE2", "CPNE7", "CDHR2", "GNLY", "APOBEC3B", "MFSD9", "SYNGR3", "PTGDS", "COL17A1", "TBC1D14", "AIM2", "TMEM204", "FAM157B", "ZBED6", "EME1", "ATF3", "KBTBD4", "LUC7L2", "KIF20A", "LCNL1", "DOCK9-AS2", "KCNE1", "BTN2A3P", "KL", "IDI2-AS1", "EBF4", "SCARNA21", "CEACAM6", "KLRB1", "C5orf58", "ASXL2", "RPLP0P2", "CYTL1", "DIAPH3", "DOK7", "RFFL", "KIAA1107", "TAS2R40", "CCDC186", "COL6A2", "METRN", "SNHG25", "RRM2", "CYP1B1", "NEURL1", "MATK", "SLC28A3", "JCHAIN", "TNFRSF4", "FXYD1", "PLLP", "ARHGAP23", "SNORA4", "MYO18A", "ZNF429", "NRN1", "HJURP", "TCN1", "CDC6", "ATP5EP2", "SOAT2", "LOC101928034", "EIF2AK2", "ARG1", "SLC16A11", "TPPP3", "TMEM38A", "TOP2A", "LINC00999", "DGCR9", "RCAN3AS", "CACNG6", "LINC01550", "TDRD9", "CARD17", "GBP6", "LY6E", "RSAD2", "LOC100506258", "PRKAR2A", "LTF", "IGLL5", "FAM157A", "LOC101927018", "CCR7", "FLJ42351", "IFIT3", "GPRIN1", "ANXA9", "TMEM119", "PARGP1", "A3GALT2", "CYP4F22", "PLBD1-AS1", "SELM", "NCR3", "PNPLA1", "BMX", "LOC440461", "GAMT", "CEACAM8", "TP53I13", "C1orf226", "SKA3", "DHRS3", "VRK2", "BTBD19", "ETNK2", "LOC728323", "NRIR", "ADORA2A", "GPR162", "CMPK2", "USP18", "P4HA2", "TSSK4", "EP300", "CLEC4D", "LCN10", "GPR141", "SH2D2A", "GOLGA7B", "TMIGD2", "DLL4", "HP", "CXCR6", "MAL", "C12orf57", "CLIC5", "IL4", "IGFBP6", "ERG", "HERC3", "KEL", "MSX2P1", "INE1", "PRKCQ-AS1", "FHIT", "SLC1A7", "KIAA1958", "SARDH", "PFKFB3", "SNORD89", "IFI44", "DDX60", "TMEM238", "HAR1A", "EGR1", "VNN1", "TRIM9", "TAF13", "AP3S2", "TMEM56", "KLRC2", "CACNA1C-AS2", "ALX3", "FCGBP", "CD247", "ALDH1L2", "HIST1H2AC", "RTP5", "PPARG", "AMPH", "LINC00861", "CDKL5", "MYBL2", "LOC101927051", "TLR5", "TMEM121", "BMP8B", "AK5", "RBP5", "LINC01355", "PITRM1-AS1", "CMTM1", "BIRC5", "C10orf10", "TNFRSF25", "ZAP70", "LOC105373383", "DSP", "WDR86-AS1", "RPLP2", "KREMEN1", "LOC101927550", "PDZD4", "LOC100130451", "MKI67", "LOC728743", "CXCL10", "LINC01547", "LOC645513", "ATOH8", "S1PR5", "KISS1R", "MELK", "TCEA3", "SLC22A20", "RAMP1", "FOLR2", "GGT6", "CACNA1E", "FABP6", "RAP2C-AS1", "PRRG4", "FAM63B", "BLK", "P3H3", "WIPF2", "TROAP", "FAHD2CP", "CA6", "LINC00892", "LRCH3", "BUB1B", "LOC100996286", "NT5E", "PASK", "BATF2", "TTC39C-AS1", "ACTA2", "CHIT1", "LAMC1", "TNFAIP3", "ANKRD22", "C12orf42", "SPON2", "SLX4IP", "TNNC1", "ZNF771", "SPEG", "HIST1H4H", "HTR6", "TNFRSF17", "FSD1", "LINC00266-1", "CD6", "PRSS30P", "SFTPD", "COPZ2", "BPI", "CCIN", "CDK1", "ATP2C2", "GOLGA8H", "USP44", "SLC14A1", "ZDHHC14", "SNORD50A", "LTK", "KCNG2", "MAPK11", "ACOT4", "CTSW", "C1orf106", "CDKN3", "UPB1", "CAMK2N1", "RBM5-AS1", "DNLZ", "GZMM", "PLA2G7", "ZCCHC2", "PRSS41", "RPL13", "OLR1", "BCAS4", "EPB41", "TRABD2A", "PBX4", "GZMK", "PNPLA7", "B4GALT5", "ARHGEF17", "APOA1", "GPA33", "KLRG1", "GBP5", "LOC102723701", "CENPA", "LOC285696", "KCNK5", "SUSD4", "RPS28", "ESPL1", "ITGB4", "SPAG16", "CYP4F35P", "CD3D", "BMS1P20", "CBS", "ETV2", "SPATS2L", "DUSP13", "FAM19A1", "VSIG10L", "CD2", "NHSL2", "FAAH2", "FXYD7", "NTN5", "FICD", "GLDC", "LOC101927865", "LINC00944", "PTPRCAP", "GNB3", "TRIM22", "PRRT1", "NR1I3", "BTN3A1", "STX16-NPEPL1", "TMEM191A", "SERPINB2", "UST", "GALNT12", "BUB1", "GTF2I", "FOSL2", "COL13A1", "RGS9", "NCALD", "DNAH10", "CA11", "CKB", "HSPB1", "CDC45", "ATP7B", "WNT5B", "ZNF699", "PRRT4", "GALNT14", "ZNF319", "DNAH17", "LOC283710", "CPEB4", "LY6G6C", "PPAN", "WASH5P", "HIST1H3H", "IL32", "TEPP", "CNR1", "YJEFN3", "FAM159A", "FGFBP2", "FKBP5", "BIN1", "VPREB3", "E2F8", "HK3", "CDH2", "HFE", "BEAN1-AS1", "KIFC3", "HELB", "HLA-DPB1", "GZMH", "LMNB1", "CC2D2A", "IQCH-AS1", "CTSF", "TMEM132D", "LEF1", "REL", "CBR3", "WNT10B", "LOC100289473", "APBA2", "KIF23", "LOC646471", "PNMA6A", "EPC2", "HBEGF", "S100B", "C14orf132", "KCND1", "SIPA1L2", "NCAPG", "OAS2", "C3AR1", "CSF1", "CHCHD6", "AUTS2", "IL24", "CDC42EP2", "LTBP3", "PXT1", "ADAMTS10", "BLZF1", "TPST1", "ID3", "GYG1", "EFCAB2", "MYO10", "TLE2", "SLC30A1", "CCNI", "WNT7A", "RBL2", "ERICH6-AS1", "IGFBP3", "DTL", "SORBS3", "RPS19", "SMA4", "RPS27", "BEAN1", "MIRLET7BHG", "ABCA1", "ZKSCAN7", "GPR34", "GPR153", "TRIM52", "GRASP", "RNASE2", "CENPF", "ACTG1P20", "MMP9", "ZFP82", "RTN1", "RPS21", "PCBP1-AS1", "PVRL3", "RPS10", "FER1L4", "SEPT1", "DEPDC1B", "LINC00926", "SEC14L2", "LOC100420587", "PCSK4", "HPS3", "KIR3DL1", "SPRN", "HRH2", "FAHD2B", "P3H4", "TMEM160", "ENGASE", "RAD51AP1", "ZNF233", "RAP1GAP", "TTBK2", "PINK1", "SH2D1B", "BAIAP2L1", "BECN1", "RPL13A", "INHBB", "HPCAL4", "TPM2", "ACVR2B", "CEP126", "RPL18", "B3GNT7", "ROBO3", "MYOM2", "SLC51A", "CCL5", "PROSER3", "RPL18A", "SERINC4", "ATP11B", "SMARCD3", "STMN3", "FAM173A", "CDK5RAP2", "GGH", "EIF4G3", "C18orf32", "SHCBP1", "CCM2L", "LAT", "PRF1", "ARL15", "WHAMMP1", "NBN", "ARHGEF11", "ZWINT", "BTBD11", "MCOLN2", "EYS", "GRAP", "TAP1", "FAM157C", "ANXA3", "MCEMP1", "TCF7", "IGSF9B", "SDSL", "LNPEP", "NSUN5P1", "FAM110B", "SPNS3", "ACTL10", "GCSAM", "LOC101927482", "UGCG", "CD24", "SCO2", "GMCL1", "SAMD12", "NUSAP1", "WNT1", "NME3", "LOC728084", "RGS18", "PNMA3", "KLRF1", "ENO2", "SUPT3H", "ATP5D", "ZC3H13", "PSTPIP2", "SNORD81", "SESN2", "TK1", "LHFPL2", "SCARNA10", "SERPING1", "SYT2", "SNORA33", "JAK2", "CYB5D1", "SH3RF3", "ARL14EP", "UBASH3A", "ARL5B", "SPRED2", "NELL2", "PPP2R2B", "CDH12", "WDR54", "KLF4", "MTUS1", "ELF1", "CARNS1", "CLEC10A", "CD3E", "TTK", "KBTBD7", "TPX2", "ZNF69", "AICDA", "TAMM41", "LOC100288152", "AK1", "MMP24", "SAMD9L", "RAD51", "ACE", "COLGALT2", "NEDD4", "SPEF2", "CENPE", "CRISPLD2", "TSEN54", "RCVRN", "FRMD3", "SKAP1", "CYP4F3", "TMEM161B-AS1", "KANSL1L", "SLC29A2", "CEP97", "XAF1", "CDKN1C", "PRDM5", "HBP1", "CACNG8", "RP2", "OASL", "NPIPA1", "ZNF354A", "RPL32", "GLTSCR2", "CD52", "SBK1", "ZNF703", "GBP1", "C4orf29", "ERV3-1", "ABCC2", "EPB41L5", "FFAR3", "PLEKHB1", "LOC100507387", "RPL36", "PRC1", "C19orf60", "PRSS23", "CD160", "HOPX", "SAMD10", "RPSAP9", "CDCA2", "SWT1", "NPEPL1", "RORC", "MS4A3", "BCL2L15", "CXCR5", "EPHX2", "B3GNT9", "CDCA7L", "LMTK2", "UBAP1L", "CD79B", "OBSCN", "TMEM102", "ZNF540", "SPP1", "HABP4", "LOC100130872", "APBB1", "GPC2", "CD1C", "LONRF3", "NR2C2", "NSUN7", "SIGIRR", "SNORD38B", "FAM65C", "HELZ2", "ARL4D", "ENO3", "RPL9", "IFT81", "LSMEM2", "SCARNA2", "CD5", "AHNAK2", "RPL27A", "SOX8", "TMEM161A", "ZNF81", "PXK", "LOC441081", "RPS26", "CCNB1", "PLXDC1", "NFKBIA", "PKMYT1", "SLC27A5", "LRRC4", "TARP", "MAP2K6", "EIF1B-AS1", "SCARNA17", "NUDT8", "EAF1", "TBC1D8", "SESTD1", "CLEC12B", "ZNF776", "PDCD1", "FBXL16", "SLFN14", "ATP8B3", "ZNF396", "STOM", "CCDC30", "FAM86FP", "FAM129C", "TMEM42", "ZNF607", "IL11RA", "ECHDC2", "CCNE2", "PUS7L", "EFCAB12", "TGFA", "MAPK14", "NSG1", "C9orf142", "KLHL15", "LOC102723766", "VEGFB", "TJP3", "YAE1D1", "PROS1", "CSGALNACT2", "HLA-DOA", "TUBBP5", "RPL37A", "FAM195A", "LTB4R2", "NCAPH", "EVL", "CR1", "LTC4S", "ANKS3", "RPL35", "GLIS2", "TRAPPC6A", "LIPN", "RPS12", "RPL38", "LIME1", "PHGDH", "C4orf48", "SLED1", "BACH2", "EVA1C", "GATA3", "SLC25A38", "USP32", "RPL39", "EGR2", "USP35", "ZNF662", "PLEKHG1", "CRTAM", "AANAT", "OPLAH", "FBXO6", "LOXL1", "LOC101928786", "FRMD4B", "IL1R1", "ADM2", "DNASE1L1", "STAT4", "RPLP1", "TTC9", "BEND7", "F8", "FOSB", "SLAMF6", "STK17B", "PVT1", "ARVCF", "APOBEC3C", "CDK14", "RPS14", "POLQ", "CDC42BPG", "CCDC85B", "UBR5-AS1", "TNNT3", "TCL1A", "IL7R", "PTX3", "KLHL14", "MTRNR2L1", "ZBTB46", "RPL34", "VPS9D1-AS1", "KLF7", "RPL10A", "SLC2A11", "ACTN4", "RPSA", "SGK223", "PLSCR1", "SBF2", "LINC01420", "CDCA5", "F5", "ADGRB2", "RPL23A", "MAN1A2", "LLGL2", "GINS2", "NUDT14", "TG", "RSRC1", "TMEM256", "SYTL2", "TYSND1", "TPGS1", "ABHD14B", "LSM7", "ZNF281", "CEMP1", "M1AP", "CD82", "LOC101928150", "MRPL41", "IFIH1", "CCNB2", "IFITM10", "RPS3A", "TMEM8B", "CEP135", "SIRPB2", "IRS2", "SYCE1L", "SULT1B1", "ADAM9", "ZCCHC18", "DDIAS", "LINC01278", "MTHFD2", "TIGIT", "FUOM", "FOSL1", "RPS16", "BRAF", "CACNA1I", "EXT1", "GPR82", "LRRC45", "STAG1", "KIF11", "NCAM1", "RNF24", "KIAA2018", "SAMD9", "ABCA2", "PVRIG", "RASGRF2", "IRAK2", "ARHGEF4", "ZNF682", "RASSF7", "THAP7", "KIF1B", "GAS5", "KIF15", "RMRP", "GALM", "LYNX1", "C7orf50", "ATXN1L", "KCNN4", "LDLRAP1", "RETSAT", "RNF10", "NOXA1", "UBXN7", "UHRF1BP1L", "TESPA1", "MB21D1", "LINC00116", "FOXM1", "CCR6", "NMUR1", "RPL22", "LCK", "MEGF9", "CLSPN", "MIR4697HG", "PPP1R15A", "ADCK5", "SAMD3", "RPS27A", "TPPP", "PIWIL4", "ANKRD33B", "IL18RAP", "SNRPD2", "WASF1", "ALDH5A1", "FAM149B1", "RPS18", "SLCO4C1", "MGC16275", "ZNF837", "SAMHD1", "NSMF", "PDIA6", "SNX20", "ATF7IP2", "BPHL", "RPL35A", "NFKBIZ", "LMF1", "MGMT", "PPL", "FAM120C", "APRT", "RANGRF", "PHLDB3", "IDNK", "RPS15", "LGR6", "MOB1A", "CREB5", "THEM4", "ENDOG", "RPL7", "EDN1", "ZNF808", "SNHG15", "RPL3", "SMCR8", "FCMR", "ZNF449", "ZBTB37", "NHLRC4", "DHRS9", "C1QTNF3", "MS4A1", "AFF2", "FBXO32", "SLC6A6", "ZSCAN30", "CHPT1", "PARP14", "MZT2B", "FLT3LG", "TCTN2", "MAN1A1", "LOC728175", "ALOX5", "DUSP18", "ZC3H12D", "PECR", "LRRC37A3", "EPB41L4A-AS1", "SPAG5", "KDM7A", "DDX31", "NCOA6", "SLC6A12", "FCER1A", "FBXL13", "AKR7A2", "PRR5", "PRKCE", "PPP1R3D", "SYNM", "GLI1", "NTNG2", "EEF1G", "LOC643802", "MAGEE1", "PIK3AP1", "RPS8", "SNHG19", "C19orf70", "GAS7", "PHF12", "ATP11A", "SLC22A23", "ATP6V0E2", "UCKL1-AS1", "TIPARP", "BEX2", "FAM102A", "RPS20", "TTC16", "PLP2", "HAPLN3", "C19orf24", "ZNF397", "FOXO4", "TRAPPC2B", "QTRT1", "CDK10", "PDZD8", "GIPC1", "CD274", "C9orf139", "SPIB", "KLHDC7B", "ZNF32", "ELMO2", "AK4", "SAMD4B", "MFSD3", "EXD3", "SLC37A3", "RPL8", "TRIM56", "NMB", "PIPOX", "PXN-AS1", "SLC2A5")



## ----enrichr_libs, echo=TRUE, message=TRUE------------------------------------
enrichr_libs <- rba_enrichr_libs()

## ----enrichr_libs_df, echo=FALSE----------------------------------------------
if (is.data.frame(enrichr_libs)) {
  DT::datatable(data = enrichr_libs,
                autoHideNavigation = TRUE,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----enrichr, echo=TRUE, message=TRUE-----------------------------------------
enrichr_enrich <- rba_enrichr(gene_list = covid_critical,
                              gene_set_library = "KEGG_2021_Human")

## ----enrichr_df, echo=FALSE---------------------------------------------------
if (is.data.frame(enrichr_enrich)) {
  enrichr_enrich <- enrichr_enrich[order(enrichr_enrich$Adjusted.P.value),]
  enrichr_enrich <- enrichr_enrich[1:min(10,
                                         nrow(enrichr_enrich)),]
  DT::datatable(data = enrichr_enrich,
                autoHideNavigation = TRUE,
                options = list(scrollX = TRUE, 
                               paging = TRUE,
                               fixedHeader = TRUE,
                               keys = TRUE,
                               pageLength = 10
                ))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----enrichr_multi_libs, echo=TRUE, message=TRUE------------------------------
enrichr_enrich_kegg <- rba_enrichr(gene_list = covid_critical,
                                   gene_set_library = "kegg",
                                   regex_library_name = TRUE # default value
)

## ----enrichr_multi_libs_str, echo=TRUE, message=TRUE--------------------------
str(enrichr_enrich_kegg, max.level = 2)

## ----reactome, echo=TRUE, message=TRUE----------------------------------------
reactome <- rba_reactome_analysis(input = covid_critical)

## ----reactome_str, echo=TRUE, message=TRUE------------------------------------
str(reactome, max.level	= 1)

## ----reactome_df, echo=FALSE--------------------------------------------------
if (is.list(reactome) && is.data.frame(reactome$pathways)) {
  reactome$pathways <- reactome$pathways[1:min(10,
                                               nrow(reactome$pathways)),]
  DT::datatable(data = reactome$pathways,
                autoHideNavigation = TRUE,
                options = list(scrollX = TRUE, 
                               paging = TRUE,
                               fixedHeader = TRUE,
                               keys = TRUE,
                               pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----reactome_summary_dummy, echo=FALSE---------------------------------------
#### this is to prevent vignetee building failarue in case of service being down.
if(!is.list(reactome)) {
  reactome <- list(summary = list(token = "Vignette building failed. It is probably because the web service was down during the building."))
}

## ----reactome_summary, echo=TRUE, message=TRUE--------------------------------
str(reactome$summary)

## ----reactome_token, echo=TRUE, message=TRUE, eval=FALSE----------------------
#  reactome_2 <- rba_reactome_analysis_token(reactome$summary$token)

## ----reactome_download, echo=TRUE, message=TRUE, eval=FALSE-------------------
#  rba_reactome_analysis_download(token = reactome$summary$token,
#                                 request = "not_found_ids",
#                                 save_to = "my_analysis.csv")

## ----reactome_pdf, echo=TRUE, message=TRUE, eval=FALSE------------------------
#  rba_reactome_analysis_pdf(token = reactome$summary$token,
#                            species = 9606, #Homo sapiens
#                            save_to = "my_analysis.pdf")

## ----panther_sets, echo=TRUE, message=TRUE------------------------------------
panther_sets <- rba_panther_info(what = "datasets")

## ----panther_sets_df, echo=FALSE----------------------------------------------
if (is.data.frame(panther_sets)) {
  panther_sets <- panther_sets[,-which(colnames(panther_sets) == "description")]
  DT::datatable(data = panther_sets,
                autoHideNavigation = TRUE,
                options = list(scrollX = TRUE, 
                               paging = TRUE,
                               fixedHeader = TRUE,
                               keys = TRUE,
                               pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----panther_enrich, echo=TRUE, message=TRUE----------------------------------
panther_enrich <- rba_panther_enrich(genes = covid_critical,
                                     organism = 9606, #Homo sapiens
                                     annot_dataset = "GO:0008150" #Biological Process
                                     )

## ----panther_enrich_str, echo=TRUE, message=TRUE------------------------------
str(panther_enrich)

## ----panther_enrich_df, echo=FALSE--------------------------------------------
if (is.list(panther_enrich) && is.data.frame(panther_enrich$result)) {
  panther_enrich$result <- panther_enrich$result[1:min(10,
                                                       nrow(panther_enrich$result)),]
  DT::datatable(data = panther_enrich$result,
                autoHideNavigation = TRUE,
                options = list(scrollX = TRUE, 
                               paging = TRUE,
                               fixedHeader = TRUE,
                               keys = TRUE,
                               pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----string_enrich, echo=TRUE, message=TRUE-----------------------------------
string_enrich <- rba_string_enrichment(ids = covid_critical,
                                       species = 9606 #Homo sapiens
                                       )

## ----string_str, echo=TRUE, message=TRUE--------------------------------------
str(string_enrich, max.level = 1)

## ----string_df, echo=FALSE----------------------------------------------------
if (is.list(string_enrich) && is.data.frame(string_enrich$PMID)) {
  string_enrich$PMID <- string_enrich$PMID[,                                           !colnames(string_enrich$PMID) %in% c("inputGenes", "preferredNames")]                                             
  string_enrich$PMID <- string_enrich$PMID[1:min(10, 
                                                 nrow(string_enrich$PMID)),]
  DT::datatable(data = string_enrich$PMID,
                autoHideNavigation = TRUE,
                options = list(scrollX = TRUE, 
                               paging = TRUE,
                               fixedHeader = TRUE,
                               keys = TRUE,
                               pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----string_annot, echo=TRUE, message=TRUE------------------------------------
string_annot <- rba_string_annotations(ids = "CD177",
                                       species = 9606, #Homo sapiens
                                       allow_pubmed = TRUE
                                       )

## ----string_annot_str, echo=TRUE, message=TRUE--------------------------------
str(string_annot, max.level = 1)

## ----string_annot_df, echo=FALSE----------------------------------------------
if (is.list(string_annot) && is.data.frame(string_annot$PMID)) {
  string_annot$PMID <- string_annot$PMID[1:min(10, 
                                                 nrow(string_annot$PMID)),]
  DT::datatable(data = string_annot$PMID,
                autoHideNavigation = TRUE,
                options = list(scrollX = TRUE, 
                               paging = TRUE,
                               fixedHeader = TRUE,
                               keys = TRUE,
                               pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----input_mirs, echo=TRUE, message=TRUE--------------------------------------
covid_mirna <- c("hsa-miR-3609", "hsa-miR-199a-5p", "hsa-miR-139-5p", "hsa-miR-145-5p","hsa-miR-3651", "hsa-miR-1273h-3p", "hsa-miR-4632-5p","hsa-miR-6861-5p", "hsa-miR-6802-5p","hsa-miR-5196-5p","hsa-miR-92b-5p", "hsa-miR-6805-5p","hsa-miR-98-5p","hsa-miR-3185", "hsa-miR-572","hsa-miR-371b-5p","hsa-miR-3180", "hsa-miR-8073","hsa-miR-4750-5p","hsa-miR-6075", "hsa-let-7i-5p","hsa-miR-1231","hsa-miR-885-3p")

## ----mieaa_libs, echo=TRUE, message=TRUE--------------------------------------
rba_mieaa_cats(mirna_type = "mature",
               species = 9606 #Homo sapiens
)

## ----mieaa, echo=TRUE, message=TRUE-------------------------------------------
mieaa_enrich <- rba_mieaa_enrich(test_set = covid_mirna,
                                 mirna_type = "mature",
                                 test_type = "ORA",
                                 species = 9606,
                                 categories = "miRPathDB_GO_Biological_process_mature")

## ----mieaa_df, echo=FALSE-----------------------------------------------------
if (is.data.frame(mieaa_enrich)) {
  mieaa_enrich <- mieaa_enrich[1:10,]
  DT::datatable(data = mieaa_enrich,
                autoHideNavigation = TRUE,
                options = list(scrollX = TRUE, 
                               paging = TRUE,
                               fixedHeader = TRUE,
                               keys = TRUE,
                               pageLength = 10
                ))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

