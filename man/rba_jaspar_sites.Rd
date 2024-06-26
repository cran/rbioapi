% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/jaspar.R
\name{rba_jaspar_sites}
\alias{rba_jaspar_sites}
\title{Get binding sites of a matrix profile}
\usage{
rba_jaspar_sites(matrix_id, ...)
}
\arguments{
\item{matrix_id}{Character: A matrix profile
Identifier. It has "base_id.version" naming schema.}

\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
A list that contains a data frame with binding sites information.
}
\description{
Use this function to retrieve a list of transcription factor binding sites
  associated with a matrix profile.
}
\section{Corresponding API Resources}{

 "GET https://jaspar.elixir.no/api/v1/sites/\{matrix_id\}/"
}

\examples{
\donttest{
rba_jaspar_sites("MA0600.1")
}

}
\references{
\itemize{
  \item Rauluseviciute I, Riudavets-Puig R, Blanc-Mathieu R,
  Castro-Mondragon JA, Ferenc K, Kumar V, Lemma RB, Lucas J, Chèneby J,
  Baranasic D, Khan A, Fornes O, Gundersen S, Johansen M, Hovig E, Lenhard
  B, Sandelin A, Wasserman WW, Parcy F, Mathelier A JASPAR 2024:
  20th anniversary of the open-access database of transcription factor
  binding profiles Nucleic Acids Res. in_press; doi: 10.1093/nar/gkad1059
  \item Khan, A. and Mathelier, A. JASPAR RESTful API: accessing JASPAR data
  from any programming language. Bioinformatics, 2017,
  doi: 10.1093/bioinformatics/btx804
  \item
  \href{https://jaspar.elixir.no/api/v1/docs/}{JASPAR API Documentation}
  \item \href{https://jaspar.elixir.no/faq/}{Citations note
  on JASPAR website}
  }
}
\seealso{
Other "JASPAR": 
\code{\link{rba_jaspar_collections}()},
\code{\link{rba_jaspar_collections_matrices}()},
\code{\link{rba_jaspar_matrix}()},
\code{\link{rba_jaspar_matrix_search}()},
\code{\link{rba_jaspar_matrix_versions}()},
\code{\link{rba_jaspar_releases}()},
\code{\link{rba_jaspar_species}()},
\code{\link{rba_jaspar_species_matrices}()},
\code{\link{rba_jaspar_taxons}()},
\code{\link{rba_jaspar_taxons_matrices}()},
\code{\link{rba_jaspar_tffm}()},
\code{\link{rba_jaspar_tffm_search}()}
}
\concept{"JASPAR"}
