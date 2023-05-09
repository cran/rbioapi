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

## ----install_cran, eval=FALSE-------------------------------------------------
#  install.packages("rbioapi")

## ----install_github, eval=FALSE-----------------------------------------------
#  install.packages("remotes")
#  remotes::install_github("moosa-r/rbioapi")

## ----load_rbioapi, echo=TRUE--------------------------------------------------
library(rbioapi)

## ----prevent_vignette_errors, message=FALSE, warning=FALSE, include=FALSE-----
rba_options(timeout = 30, skip_error = TRUE)

## ----naming_example, echo=TRUE, message=TRUE----------------------------------
rba_string_version()

## ----rba_options, echo=TRUE, message=TRUE-------------------------------------
rba_options()

## ----rba_options_global, eval=FALSE-------------------------------------------
#  rba_options(save_file = TRUE)
#  ## From now on, the raw file of server's response will be saved to your working directory.
#  rba_options(verbose = FALSE)
#  ## From now on, the package will be quiet.

## ----rba_options_ellipsis1, eval=FALSE----------------------------------------
#  ## Save the server's raw response file:
#  x <- rba_reactome_species(only_main = TRUE, save_file = "reactome_species.json")
#  ## Also, in the case of connection failure, retry up to 10 times:
#  x <- rba_reactome_species(only_main = TRUE,
#                           save_file = "reactome_species.json", retry_max = 10)

## ----rba_options_ellipsis2, eval=FALSE, echo=TRUE, message=TRUE---------------
#  ## Run these codes in your own R session to see the difference.
#  ## show internal diagnostics boring details
#  x <- rba_uniprot_proteins_crossref(db_id = "CD40", db_name = "HGNC", diagnostics = TRUE)
#  ## The next function you call, will still use the default rbioapi options
#  x <- rba_uniprot_proteins_crossref(db_id = "CD40", db_name = "HGNC")

## ----rba_connection_test, message=TRUE----------------------------------------
rba_connection_test(print_output = TRUE)

## ----rba_pages1, echo=TRUE----------------------------------------------------
adeno <- rba_uniprot_taxonomy_name(name = "adenovirus",
                                   search_type = "contain",
                                   page_number = 1)
str(adeno, max.level = 2)

## ----rba_pages2, echo=TRUE----------------------------------------------------
adeno_pages = rba_pages(quote(rba_uniprot_taxonomy_name(name = "adenovirus",
                                   search_type = "contain",
                                   page_number = "pages:1:3")))
## You can inspect the structure of the response:
str(adeno_pages, max.level = 2)

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

