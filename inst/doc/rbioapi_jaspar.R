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
rba_options(timeout = 30, skip_error = TRUE)

## ----release------------------------------------------------------------------
## Call the function without any arguments to get a list of releases
releases <- rba_jaspar_releases()
## Supply a release number for details:
release_7_info <- rba_jaspar_releases(7)

## ----collections--------------------------------------------------------------
## To get a list of available collection in release 2020:
rba_jaspar_collections(release = 2020)


## You can list information of all matrices available in a collection:
mat_in_core_2020 <- rba_jaspar_collections_matrices(collection = "CORE")

## ----taxons-------------------------------------------------------------------
## To get a list of taxonomic groups in release 2020:
rba_jaspar_taxons(release = 2020)


## You can list information of all matrices available in a taxonomic group:
mat_in_insects <- rba_jaspar_taxons_matrices(tax_group = "insects")

## ----species------------------------------------------------------------------
## To get a list of species in release 2020:
species <- rba_jaspar_species(release = 2020)
head(species)

## You can list information of all matrices available in a specie:
mat_in_human <- rba_jaspar_species_matrices(tax_id = 9606)

## ----search, eval=FALSE-------------------------------------------------------
#  ## Get a list of all the available matrix profile:
#  all_matrices <- rba_jaspar_matrix_search()
#  
#  ## Search FOX:
#  FOX_matrices <- rba_jaspar_matrix_search(term = "FOX")
#  
#  ## Transcription factors named FOXP3
#  FOXP3_matrices <- rba_jaspar_matrix_search(term = "FOXP3")
#  
#  ## Transcription factors of Zipper-Type Class
#  zipper_matrices <- rba_jaspar_matrix_search(tf_class = "Zipper-Type")
#  
#  ## Transcription factors of Zipper-Type Class in PBM collection
#  zipper_pbm_matrices <- rba_jaspar_matrix_search(tf_class = "Zipper-Type",
#                                                  collection = "PBM")

## ----versions, eval=FALSE-----------------------------------------------------
#  ## Get matrix profiles versions associated to a base id
#  MA0600_versions <- rba_jaspar_matrix_versions("MA0600")

## ----matrix_r_object----------------------------------------------------------
pfm_matrix <- rba_jaspar_matrix(matrix_id = "MA0600.2")

## you can find the matrix in the pfm element along with
## other elements which correspond to annotations and details
str(pfm_matrix)

## ----matrix_save, eval=FALSE--------------------------------------------------
#  ## Different wqays in which you can save the matrix file:
#  meme_matrix1 <- rba_jaspar_matrix(matrix_id = "MA0600.2",
#                                    file_format = "meme")
#  
#  meme_matrix2 <- rba_jaspar_matrix(matrix_id = "MA0600.2",
#                                    file_format = "meme",
#                                    save_to = "my_matrix.meme")
#  
#  meme_matrix3 <- rba_jaspar_matrix(matrix_id = "MA0600.2",
#                                    file_format = "meme",
#                                    save_to = "c:/rbioapi")
#  
#  meme_matrix4 <- rba_jaspar_matrix(matrix_id = "MA0600.2",
#                                    file_format = "meme",
#                                    save_to = "c:/rbioapi/my_matrix.meme")

## ----sites, eval=FALSE--------------------------------------------------------
#  ## Get binding site of a matrix profile:
#  binding_sites <- rba_jaspar_sites(matrix_id = "MA0600.2")

## ----tffm_search, eval=FALSE--------------------------------------------------
#  ## Search TFFMs. This is a search function. Thus, what has been presented
#  ## in `Search Matrix Profiles` section also applies here:
#  
#  ## Get a list of all the available matrix profile:
#  all_tffms <- rba_jaspar_tffm_search()
#  
#  ## Search FOX:
#  FOX_tffms <- rba_jaspar_tffm_search(term = "FOX")
#  
#  ## Transcription factors named FOXP3
#  FOXP3_tffms <- rba_jaspar_tffm_search(term = "FOXP3")
#  
#  ## Transcription factors of insects taxonomic group
#  insects_tffms <- rba_jaspar_tffm_search(tax_group = "insects")

## ----tffm---------------------------------------------------------------------
## Now that you have a TFFM ID, you can retrieve it
TFFM0056 <- rba_jaspar_tffm("TFFM0056.3")
str(TFFM0056)

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

