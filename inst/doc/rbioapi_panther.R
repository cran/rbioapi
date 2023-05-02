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

## ----rba_panther_enrich, message=TRUE-----------------------------------------
## 1 We get the available annotation datasets in PANTHER (we need to select one of them to submit an enrichment request)
annots <- rba_panther_info(what = "datasets")
# Note that you should enter the "id" of the datasets, not its label (e.g. entering "biological_process" is incorrect, you should rather enter "GO:0008150").
## 2 We create a variable with our genes' IDs
genes <- c("p53", "BRCA1", "cdk2", "Q99835", "CDC42","CDK1","KIF23","PLK1",
           "RAC2","RACGAP1","RHOA","RHOB", "PHF14", "RBM3", "MSL1")
## 3 Now we can submit the enrichment request.
enriched <- rba_panther_enrich(genes = genes,
                               organism = 9606,
                               annot_dataset = "ANNOT_TYPE_ID_PANTHER_PATHWAY",
                               cutoff = 0.05)

## ----enriched_df, echo=FALSE--------------------------------------------------
if (utils::hasName(enriched, "result") && is.data.frame(enriched$result)) {
  DT::datatable(data = enriched$result,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 10))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

