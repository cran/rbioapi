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

## ----rba_uniprot_proteins-----------------------------------------------------
## 1 We can retrieve CD40 protein's information by qurying it's UniProt accession:
cd40 <- rba_uniprot_proteins(accession = "P29965")

## 2 We use str() to inspect our object's structure
str(cd40, 1)

## ----rba_uniprot_proteins_search----------------------------------------------
## 1 From the available arguments, we fill only those which we think is pertinent
cd40_search <- rba_uniprot_proteins_search(
  protein = "CD40 ligand",
  organism = "human",
  reviewed = TRUE
)

## 2 As always, we use str() to inspect our object's structure
str(cd40_search, 2)

## ----rba_uniprot_proteins_search1_2-------------------------------------------
## 1 As the simplest scenario, we can retrieve multiple proteins in one call
multi_prs1 <- rba_uniprot_proteins_search(
  accession = c("P04637", "P38398", "P24941", "P60953", "P06493", "Q02241")
)
## As always, we use str() to inspect our object's structure
str(multi_prs1, 1)

## 2 Or alternatively, search using Gene names, also we want to exclude isoforms and only retrieve swiss-prot entries
multi_prs2 <- rba_uniprot_proteins_search(
  gene = c("KIF23", "BRCA1", "TP53", "CDC42"),
  reviewed = TRUE,
  taxid = 9606,
  isoform = 0
)

str(multi_prs2, 1)

## ----rba_uniprot_proteins_search3---------------------------------------------
## 3 Search for every proteins with chemokines keyword
multi_prs3 <- rba_uniprot_proteins_search(
  keyword = "chemokines"
)

str(multi_prs3, 1)

## ----rba_uniprot_proteins_search4---------------------------------------------
## 4 Search for every protein of "SARS-CoV-2" virus in Swiss-Prot
multi_prs4 <- rba_uniprot_proteins_search(
  organism = "SARS-CoV-2",
  reviewed = TRUE
)

str(multi_prs4, 1)

## ----sessionInfo, echo=FALSE--------------------------------------------------
sessionInfo()

