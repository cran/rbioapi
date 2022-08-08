## ----message=FALSE, include=FALSE, results="hide", setup, echo=FALSE----------
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

## ----enrichr_libs-------------------------------------------------------------
enrichr_libs <- rba_enrichr_libs()

## ----enrichr_libs_df, echo=FALSE----------------------------------------------
if (is.data.frame(enrichr_libs)) {
  DT::datatable(data = enrichr_libs,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----approach_1---------------------------------------------------------------
# 1 We create a variable with our genes' NCBI IDs
genes <- c("p53", "BRCA1", "cdk2", "Q99835", "CDC42","CDK1","KIF23","PLK1",
           "RAC2","RACGAP1","RHOA","RHOB", "PHF14", "RBM3", "MSL1")

# 2.a Do enrichment analysis on your genes using "MSigDB_Hallmark_2020" library
enrichr_msig_hallmark <- rba_enrichr(gene_list = genes,
                                     gene_set_library = "MSigDB_Hallmark_2020")
# 2.b Maybe you want to perform enrichment analysis using every library that contains the word "msig":
enrichr_msig <- rba_enrichr(gene_list = genes,
                            gene_set_library = "msig",
                            regex_library_name = TRUE)
# 2.c Or maybe you want to perform enrichment analysis using every library available at Enrichr:
# enrichr_all <- rba_enrichr(gene_list = genes,
#                            gene_set_library = "all")

## ----approach_1_single--------------------------------------------------------
str(enrichr_msig_hallmark)

## ----approach_1_multi---------------------------------------------------------
str(enrichr_msig, 1)

## ----approach_2---------------------------------------------------------------
# 1 Get a list of available Enrichr libraries
libs <- rba_enrichr_libs(store_in_options = TRUE)

# 2 Submit your gene-set to enrichr
list_id <- rba_enrichr_add_list(gene_list = genes)

# 3 Perform Enrichment analysis with your uploaded gene-set
enriched <- rba_enrichr_enrich(user_list_id = list_id$userListId,
                               gene_set_library = "Table_Mining_of_CRISPR_Studies")

## As always, use str() to see what you have:
str(enriched, 1)

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

