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

## ----enrich_available_annotations---------------------------------------------
annots <- rba_panther_info(what = "datasets")

## ----enrich_available_annotations_results, echo=FALSE-------------------------
if (is.data.frame(annots)) {
  DT::datatable(
    data = annots,
    options = list(
      scrollX = TRUE, 
      paging = TRUE,
      fixedHeader = TRUE,
      keys = TRUE
    )
  )
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----rba_panther_overrep, message=TRUE----------------------------------------
# Create a variable to store the genes vector
my_genes_vec <- c(
  "p53", "BRCA1", "cdk2", "Q99835", "CDC42", "CDK1","KIF23","PLK1",
  "RAC2","RACGAP1","RHOA", "RHOB", "PHF14", "RBM3", "MSL1"
)

# Submit the analysis request.
enriched <- rba_panther_enrich(
  genes = my_genes_vec,
  organism = 9606,
  annot_dataset = "GO:0008150",
  cutoff = 0.05
)

# Note that we didn't supply the `test_type` parameter.
# In this case, the function will default to using Fisher's exact test # (i.e. `test_type = "FISHER"`).
# You may also use binomial test for the over-representation analysis # (i.e. `test_type = "BINOMIAL"`).

## ----rba_panther_overrep_results, echo=FALSE----------------------------------
if (utils::hasName(enriched, "result") && is.data.frame(enriched$result)) {
  DT::datatable(
    data = enriched$result,
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

## ----rba_panther_enrich, eval=FALSE-------------------------------------------
# # Create a variable to store the data frame
# my_genes_df <- data.frame(
#   genes = c(
#     "p53", "BRCA1", "cdk2", "Q99835", "CDC42", "CDK1","KIF23","PLK1",
#     "RAC2","RACGAP1","RHOA", "RHOB", "PHF14", "RBM3", "MSL1"
#   ),
#   ## generate random expression values
#   expression = runif(15, 0, 10)
# )
# 
# # Submit the analysis request.
# enriched <- rba_panther_enrich(
#   genes = my_genes_df,
#   organism = 9606,
#   annot_dataset = "GO:0008150",
#   cutoff = 0.05
# )
# 
# # Note that we didn't supply the `test_type` parameter.
# # In this case, the function will default to Mann-Whitney U Test
# # (i.e. `test_type = "Mann-Whitney"`).
# # This is the only valid value for the statistical enrichment analysis test,
# # thus ommiting or supplying it will not make a difference.

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

