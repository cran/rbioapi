## ----message=FALSE, include=FALSE, results="hide", setup, echo=FALSE----------
knitr::opts_chunk$set(
  echo = TRUE,
  eval = TRUE,
  message = FALSE,
  warning = FALSE,
  collapse = TRUE,
  tidy = FALSE,
  cache = FALSE,
  dev = "png",
  comment = "#>"
)
library(rbioapi)
rba_options(timeout = 30, skip_error = TRUE)

## ----enrichr_libs-------------------------------------------------------------
enrichr_libs <- rba_enrichr_libs()

## ----enrichr_libs_df, echo=FALSE----------------------------------------------
if (is.data.frame(enrichr_libs)) {
  DT::datatable(
    data = enrichr_libs,
    options = list(
      scrollX = TRUE, 
      paging = TRUE,
      fixedHeader = TRUE,
      keys = TRUE,
      pageLength = 10
    )
  )
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----input_genes, eval=TRUE---------------------------------------------------
# Create a vector with our genes' NCBI IDs
genes <- c(
  "p53", "BRCA1", "cdk2", "Q99835", "CDC42","CDK1","KIF23","PLK1",
  "RAC2","RACGAP1","RHOA","RHOB", "PHF14", "RBM3", "MSL1"
)

## ----approach_1_all, eval=FALSE-----------------------------------------------
# # Request the enrichment analysis
# results_all <- rba_enrichr(gene_list = genes)

## ----waiting1, echo=FALSE-----------------------------------------------------
#wait 3 seconds to prevent rate limiting
Sys.sleep(3)

## ----approach_1_select, eval=TRUE---------------------------------------------
# Request the enrichment analysis by a specific library
results_msig_hallmark <- rba_enrichr(
  gene_list = genes,
  gene_set_library = "MSigDB_Hallmark_2020",
  progress_bar = FALSE # to avoid printing issues in the vignette
)

## ----approach_1_select_df, echo=FALSE-----------------------------------------
if (is.data.frame(results_msig_hallmark)) {
  DT::datatable(
    data = results_msig_hallmark,
    options = list(
      scrollX = TRUE, 
      paging = TRUE,
      fixedHeader = TRUE,
      keys = TRUE,
      pageLength = 10
    )
  )
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----waiting2, echo=FALSE-----------------------------------------------------
#wait 3 seconds to prevent rate limiting
Sys.sleep(3)

## ----approach_1_regex, eval=TRUE----------------------------------------------
# Request the enrichment analysis
results_msig <- rba_enrichr(
  gene_list = genes,
  gene_set_library = "msig",
  regex_library_name = TRUE,
  progress_bar = FALSE # to avoid printing issues in the vignette
)

# You can drop `regex_library_name = TRUE`, as it is TRUE by default.

## ----approach_1_single, eval=is.data.frame(results_msig_hallmark)-------------
str(results_msig_hallmark)

## ----approach_1_multi, eval=is.list(results_msig)&&is.data.frame(results_msig[[1]])----
str(results_msig, 1)

## ----approach_2_libs, eval=FALSE----------------------------------------------
# # Get a list of available Enrichr libraries
# libs <- rba_enrichr_libs(store_in_options = TRUE)

## ----waiting3, echo=FALSE-----------------------------------------------------
#wait 3 seconds to prevent rate limiting
Sys.sleep(3)

## ----approach_2_add_list, eval=TRUE-------------------------------------------
# Submit your gene-set to enrichr
list_id <- rba_enrichr_add_list(gene_list = genes)

## ----approach_2_str_list, eval=utils::hasName(list_id, "userListId")----------
str(list_id)

## ----waiting4, echo=FALSE-----------------------------------------------------
#wait 3 seconds to prevent rate limiting
Sys.sleep(3)

## ----approach_2_enrichr_request, eval=utils::hasName(list_id, "userListId")----
# Request the analysis
results_crispr <- rba_enrichr_enrich(
  user_list_id = list_id$userListId,
  gene_set_library = "Table_Mining_of_CRISPR_Studies"
)

## ----approach_2_enrichr_results, eval=TRUE, echo=FALSE------------------------
if (exists("results_crispr") && is.data.frame(results_crispr)) {
  DT::datatable(
    data = results_crispr,
    options = list(
      scrollX = TRUE, 
      paging = TRUE,
      fixedHeader = TRUE,
      keys = TRUE,
      pageLength = 10
    )
  )
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----background_gene_list_approach1, eval=FALSE-------------------------------
# # Assume we have the background genes in the variable my_background_genes
# results_msig <- rba_enrichr(
#   gene_list = genes,
#   background_genes = my_background_genes,
#   regex_library_name = TRUE
# )

## ----background_gene_list_approach2, eval=FALSE-------------------------------
# 
# # Assume we have the background genes in the variable my_background_genes
# 
# # Create a vector with our genes' NCBI IDs
# genes <- c(
#   "p53", "BRCA1", "cdk2", "Q99835", "CDC42","CDK1","KIF23","PLK1",
#   "RAC2","RACGAP1","RHOA","RHOB", "PHF14", "RBM3", "MSL1"
# )
# 
# # Step 1: Upload the target gene list to speedrichr
# # Note: Ensure `speedrichr = TRUE` is specified. Otherwise, it will not be
# #       possible to use the background gene list later.
# list_id_spdr <- rba_enrichr_add_list(
#   gene_list = genes,
#   speedrichr = TRUE
# )
# 
# # Step 2: Upload the background gene list
# # Assume we have the background genes in the variable my_background_genes
# background_id <- rba_enrichr_add_background(background_genes = my_background_genes)
# 
# # Step 3: Submit the enrichment analysis and retrieve the results
# go_results <- rba_enrichr_enrich(
#   user_list_id = list_id_spdr$userListId,
#   background_id = background_id$backgroundid,
#   gene_set_library = "GO"
# )
# 

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

