% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uniprot_uniparc.R
\name{rba_uniprot_uniparc_bestguess}
\alias{rba_uniprot_uniparc_bestguess}
\title{Get UniParc Longest Sequence for Entries}
\usage{
rba_uniprot_uniparc_bestguess(
  upi = NULL,
  accession = NULL,
  db_id = NULL,
  gene = NULL,
  taxid = NULL,
  ...
)
}
\arguments{
\item{upi}{unique UniParc Identifier.}

\item{accession}{\href{https://www.uniprot.org/help/accession_numbers}{
UniProtKB primary or secondary accession}(s). You can supply up to 100
accession numbers.}

\item{db_id}{Protein ID in the cross-reference (external) database.
You can supply up to 100 IDs.}

\item{gene}{\href{https://www.uniprot.org/help/gene_name}{UniProt gene
name(s)}. You can supply up to 20 gene names.}

\item{taxid}{NIH-NCBI \href{https://www.uniprot.org/taxonomy/}{Taxon ID}.
You can supply up to 20 taxon IDs.}

\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
A list where each element correspond to a UniParc entry.
}
\description{
This function returns the UniParc Entry with a cross-reference to the
  longest active UniProtKB sequence (preferably from Swiss-Prot and if not
  then TrEMBL). If it finds more than one longest active UniProtKB sequence
  it returns 400 (Bad Request) error response with the list of cross
  references found.
}
\section{Corresponding API Resources}{

 "GET https://ebi.ac.uk/proteins/api/uniparc/bestguess"
}

\examples{
\donttest{
rba_uniprot_uniparc_bestguess("UPI00000000C9")
}

}
\references{
\itemize{
  \item The UniProt Consortium, UniProt: the universal protein
  knowledgebase in 2021, Nucleic Acids Research, Volume 49, Issue D1,
  8 January 2021, Pages D480–D489, https://doi.org/10.1093/nar/gkaa1100
  \item Andrew Nightingale, Ricardo Antunes, Emanuele Alpi, Borisas
  Bursteinas, Leonardo Gonzales, Wudong Liu, Jie Luo, Guoying Qi, Edd
  Turner, Maria Martin, The Proteins API: accessing key integrated protein
  and genome information, Nucleic Acids Research, Volume 45, Issue W1,
  3 July 2017, Pages W539–W544, https://doi.org/10.1093/nar/gkx237
  \item \href{https://www.ebi.ac.uk/proteins/api/doc/}{Proteins API
  Documentation}
  \item \href{https://www.uniprot.org/help/publications}{Citations note
  on UniProt website}
  }
}
\seealso{
Other "UniProt - UniParc": 
\code{\link{rba_uniprot_uniparc}()},
\code{\link{rba_uniprot_uniparc_search}()},
\code{\link{rba_uniprot_uniparc_sequence}()}
}
\concept{"UniProt - UniParc"}
