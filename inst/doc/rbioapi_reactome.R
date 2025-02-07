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

## ----rba_reactome_analysis----------------------------------------------------
## 1 We create a simple vector with our genes
genes <- c(
  "p53", "BRCA1", "cdk2", "Q99835", "CDC42", "CDK1", "KIF23", "PLK1", "RAC2",
  "RACGAP1", "RHOA", "RHOB", "MSL1", "PHF21A", "INSR", "JADE2", "P2RX7",
  "CCDC101", "PPM1B", "ANAPC16", "CDH8", "HSPA1L", "CUL2", "ZNF302", "CUX1",
  "CYTH2", "SEC22C", "EIF4E3", "ROBO2", "CXXC1", "LINC01314", "ATP5F1"
)

## 2 We call reactome analysis with the default parameters
analyzed <- rba_reactome_analysis(
  input = genes,
  projection = TRUE,
  p_value = 0.01
)

## 3 As always, we use str() to inspect the resutls
str(analyzed, 1)

## 4 Note that in the summary element: (analyzed$summary)
### 4.a because we supplied a simple vector, the analysis type was: over-representation
### 4.b You need the token for other rba_reactome_analysis_* functions

## 5 Analsis results are in the pathways data frame:

## ----analysis_results, echo=FALSE---------------------------------------------
if (utils::hasName(analyzed, "pathways") && is.data.frame(analyzed$pathways)) {
  DT::datatable(
    data = jsonlite::flatten(analyzed$pathways),
    options = list(
      scrollX = TRUE, 
      paging = TRUE,
      fixedHeader = TRUE,
      keys = TRUE,
      pageLength = 5
    )
  )
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}


## ----rba_reactome_analysis_pdf/download, eval=FALSE---------------------------
# # download a full pdf report
# rba_reactome_analysis_pdf(
#   token = analyzed$summary$token,
#   species = 9606
# )
# 
# # download the result in compressed json.gz format
# rba_reactome_analysis_download(
#   token = analyzed$summary$token,
#   request = "results",
#   save_to = "reactome_results.json"
# )

## ----rba_reactome_analysis_import, eval=FALSE---------------------------------
# re_uploaded <- rba_reactome_analysis_import(input = "reactome_results.json")

## ----rba_reactome_query_ex1---------------------------------------------------
## 1 query a pathway Entry
pathway <- rba_reactome_query(
  ids = "R-HSA-109581",
  enhanced = TRUE
)

## 2 As always we use str() to inspect the output's structure
str(pathway, 2)



## 3 You can compare it with the webpage of R-HSA-202939 entry:
# https://reactome.org/content/detail/R-HSA-202939

## ----rba_reactome_query_ex2---------------------------------------------------
## 1 query a protein Entry
protein <- rba_reactome_query(
  ids = 66247,
  enhanced = TRUE
)

## 2 As always we use str() to inspect the output's structure
str(protein, 1)



## 3 You can compare it with the webpage of R-HSA-202939 entry:
# https://reactome.org/content/detail/R-HSA-202939


## ----rba_reactome_xref--------------------------------------------------------
## 1 We Supply HGNC ID to find what is the corresponding database ID in Reactome
xref_protein <- rba_reactome_xref("CD40")

## 2 As always use str() to inspect the output's structure
str(xref_protein, 1)

## ----xref_mapping-------------------------------------------------------------
## 1 Again, consider CD40 protein:
xref_mapping <- rba_reactome_mapping(
  id = "CD40",
  resource = "hgnc",
  map_to = "pathways"
)

## ----xref_mapping_df, echo=FALSE----------------------------------------------
if (is.data.frame(xref_mapping)) {
  DT::datatable(
    data = xref_mapping,
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

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

