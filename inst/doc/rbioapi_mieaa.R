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
rba_options(timeout = 600)

## ----rba_mieaa_cats, eval=FALSE-----------------------------------------------
#  ## A list of available enrichment categories for:
#  ## mature human miRNA:
#  rba_mieaa_cats(mirna_type = "mature", species = 9606)
#  ## precursor human miRNA
#  rba_mieaa_cats(mirna_type = "precursor", species = 9606)
#  ## precursor zebrafish miRNA
#  rba_mieaa_cats(mirna_type = "mature", species = "Danio rerio")

## ----rba_mieaa_enrich, message=TRUE-------------------------------------------
## 1 We create a variable with our miRNAs' mature IDs
mirs <- c("hsa-miR-20b-5p", "hsa-miR-144-5p", "hsa-miR-17-5p", "hsa-miR-20a-5p",
         "hsa-miR-222-3p", "hsa-miR-106a-5p", "hsa-miR-93-5p", "hsa-miR-126-3p",
         "hsa-miR-363-3p", "hsa-miR-302c-3p", "hsa-miR-374b-5p", "hsa-miR-18a-5p",
         "hsa-miR-548d-3p", "hsa-miR-135a-3p", "hsa-miR-558", "hsa-miR-130b-5p",
         "hsa-miR-148a-3p")
## 2a We can enrich our miRNA set without limiting the enrichment to any categories
mieaa_all <- rba_mieaa_enrich(test_set = mirs,
                             mirna_type = "mature",
                             test_type = "ORA",
                             species = 9606)
## 2b Or, We can limit the enrichment to certain datasets (enrichment categories)
mieaa_kegg <- rba_mieaa_enrich(test_set = mirs,
                              mirna_type = "mature",
                              test_type = "ORA",
                              species = 9606,
                              categories = c("miRWalk_Diseases_mature",
                                            "miRWalk_Organs_mature")
                             )

## ----mieaa_kegg_table, echo=FALSE---------------------------------------------
DT::datatable(data = mieaa_kegg,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 10))


## ----rba_meaa_submit/status/results, eval=FALSE-------------------------------
#  ## 1 Submit enrichment request to miEAA
#  request <- rba_mieaa_enrich_submit(test_set = mirs,
#                                    mirna_type = "mature",
#                                    test_type = "ORA",
#                                    species = 9606,
#                                    categories = c("miRWalk_Diseases_mature",
#                                                   "miRWalk_Organs_mature")
#                                    )
#  ## 2 check for job's running status
#  rba_mieaa_enrich_status(job_id = request$job_id)
#  
#  ## 3 If the job has completed, retrieve the results
#  results <- rba_mieaa_enrich_results(job_id = request$job_id)

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

