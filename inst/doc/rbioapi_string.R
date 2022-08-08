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

## ----rba_string_map_ids-------------------------------------------------------
## 1 We create a variable with our genes' NCBI IDs
proteins <- c("p53", "BRCA1", "cdk2", "Q99835", "CDC42","CDK1","KIF23",
              "PLK1","RAC2","RACGAP1","RHOA","RHOB", "PHF14", "RBM3")
## 2 Now we map our protein IDs
proteins_mapped <- rba_string_map_ids(ids = proteins,
                                      species = 9606)
## 3 What we need and will use for the rest of this vignette is the `stringId` column

## ----rba_string_map_ids_results, echo=FALSE-----------------------------------
if (is.data.frame(proteins_mapped)) {
  DT::datatable(data = proteins_mapped,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 5))
  proteins_mapped <- proteins_mapped$stringId
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----rba_string_interactions_network------------------------------------------
int_net <- rba_string_interactions_network(ids = proteins_mapped,
                                          species = 9606,
                                          required_score = 500)

## ----rba_string_interactions_network_results, echo=FALSE----------------------
if (is.data.frame(int_net)) {
  DT::datatable(data = int_net,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 5))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----rba_string_interaction_partners------------------------------------------
## Although we supply only one protein ID here (CD40 protein), you can provide a vector of proteins as the input
int_partners <- rba_string_interaction_partners(ids = "9606.ENSP00000361359",
                                               species = 9606,
                                               required_score = 900)

## ----rba_string_interaction_partners_restults, echo=FALSE---------------------
if (is.data.frame(int_partners)) {
  DT::datatable(data = int_partners,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 5))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----rba_string_network_image_ex1, fig.show='hide'----------------------------
## Example 1:
graph_1 <- rba_string_network_image(ids = proteins_mapped,
                                   image_format = "image",
                                   species = 9606,
                                   save_image = FALSE,
                                   required_score = 500,
                                   network_flavor = "confidence")

## ----rba_string_network_image_ex1_image, echo=FALSE, fig.cap="Network images - Example 1", fig.align='center'----
if (is.array(graph_1)) {
  grid::grid.raster(graph_1, just = "center")
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----rba_string_network_image_ex2, fig.show='hide'----------------------------
## Example 2:
graph_2 <- rba_string_network_image(ids = proteins_mapped,
                                    image_format = "image",
                                    species = 9606,
                                    save_image = FALSE,
                                    required_score = 500,
                                    add_color_nodes = 5,
                                    add_white_nodes = 5,
                                   network_flavor = "actions")

## ----rba_string_network_image_ex2_image, echo=FALSE, fig.cap="Network images - Example 2", fig.align='center'----
if (is.array(graph_2)) {
  grid::grid.raster(graph_2, just = "center")
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----rba_string_enrichment----------------------------------------------------
enriched <- rba_string_enrichment(ids = proteins_mapped,
                                  species = 9606, )

## ----rba_string_enrichment_str------------------------------------------------
str(enriched, max.level = 1)

## ----rba_string_enrichment_restults, echo=FALSE-------------------------------
if (utils::hasName(enriched, "DISEASES") && is.data.frame(enriched$DISEASES)) {
  DT::datatable(data = enriched$DISEASES,
              options = list(scrollX = TRUE, 
                             paging = TRUE,
                             fixedHeader = TRUE,
                             keys = TRUE,
                             pageLength = 5))
} else {
  print("Vignette building failed. It is probably because the web service was down during the building.")
}

## ----rba_string_enrichment_ppi------------------------------------------------
rba_string_enrichment_ppi(ids = proteins_mapped,
                          species = 9606)

## ----rba_string_annotations, eval=FALSE---------------------------------------
#  annotations <- rba_string_annotations(ids = "9606.ENSP00000269305",
#                                       species = 9606)
#  
#  ## This function returns large results, so the results was not shown in this vignette.

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

