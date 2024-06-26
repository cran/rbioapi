% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reactome_content.R
\name{rba_reactome_participants}
\alias{rba_reactome_participants}
\title{Get Participants of a Reactome Event}
\usage{
rba_reactome_participants(
  event_id,
  only_physical_entities = FALSE,
  only_reference_entities = FALSE,
  ...
)
}
\arguments{
\item{event_id}{Reactome event's database ID (DbId) or Stable ID (StId).}

\item{only_physical_entities}{Logical: If TRUe, only participating
'Physical Entities' will be returned.}

\item{only_reference_entities}{Logical: If TRUe, only participating
'Reference Entities' will be returned.}

\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
List with the participant of your supplied Event ID. A Data frame
 if only physical or 'Reference Entities' was requested.
}
\description{
Participating molecules in a Reactome comprises set of 'Physical Entity' and
  'Reference Entities' class objects. Use this function to retrieve all, only
  'Physical Entity' or only 'Reference Entities' participants of given event.
}
\details{
A 'Physical Entity' Instance could include an individual molecule,
 a multi-molecular complex or a set of molecule forming a group based on
 some characteristics. a single molecule can have different 'Physical Entity'
 instances based on it's associated attributes. For example, IgK Ig kappa
 chain, has two 'Physical Entity' instances; one, with ID
 \href{https://reactome.org/content/schema/instance/browser/R-HSA-197041}{
 "R-HSA-197041"} refers to the secreted antibody protein to the
 extra-cellular region; And the second one is with ID
 \href{https://reactome.org/content/schema/instance/browser/R-HSA-2038819}{
 "R-HSA-2038819"} and refers to the plasma-membrane-integrated form of
 the antibody protein.
 \cr To make it possible to link multiple 'Physical Entity' instances of a
 molecule, Reactome uses a data class named "'Reference Entities'"
 which correspond to the invariant attribute of a molecule. for example,
 both of the above-mentioned 'Physical Entities' see a 'Reference Entities'
 named \href{https://reactome.org/content/schema/instance/browser/57819}{
 "UniProt:P01834 IGKC}.
 \cr See \href{https://reactome.org/documentation/data-model/}{Reactome
 Data Model} for more information about the data model and Physical
 Entities.
}
\section{Corresponding API Resources}{

 "GET https://reactome.org/ContentService/data/participants/\{id\}"
 \cr "GET https://reactome.org/ContentService/data/participants/\{id\}/
 participatingPhysicalEntities"
 \cr "GET https://reactome.org/ContentService/data/participants/\{id\}/
 referenceEntities"
}

\examples{
\donttest{
rba_reactome_participants("R-HSA-5682012")
}
\donttest{
rba_reactome_participants("R-HSA-5682012", only_physical_entities = TRUE)
}
\donttest{
rba_reactome_participants("R-HSA-5682012", only_reference_entities = TRUE)
}

}
\references{
\itemize{
  \item Marc Gillespie, Bijay Jassal, Ralf Stephan, Marija Milacic, Karen
  Rothfels, Andrea Senff-Ribeiro, Johannes Griss, Cristoffer Sevilla, Lisa
  Matthews, Chuqiao Gong, Chuan Deng, Thawfeek Varusai, Eliot Ragueneau,
  Yusra Haider, Bruce May, Veronica Shamovsky, Joel Weiser, Timothy Brunson,
  Nasim Sanati, Liam Beckman, Xiang Shao, Antonio Fabregat, Konstantinos
  Sidiropoulos, Julieth Murillo, Guilherme Viteri, Justin Cook, Solomon
  Shorser, Gary Bader, Emek Demir, Chris Sander, Robin Haw, Guanming Wu,
  Lincoln Stein, Henning Hermjakob, Peter D’Eustachio, The reactome
  pathway knowledgebase 2022, Nucleic Acids Research, 2021;, kab1028,
  https://doi.org/10.1093/nar/gkab1028
  \item Griss J, Viteri G, Sidiropoulos K, Nguyen V, Fabregat A,
  Hermjakob H. ReactomeGSA - Efficient Multi-Omics Comparative Pathway
  Analysis. Mol Cell Proteomics. 2020 Sep 9. doi: 10.1074/mcp. PubMed
  PMID: 32907876.
  \item \href{https://reactome.org/ContentService/}{Reactome Content
  Services API Documentation}
  \item \href{https://reactome.org/cite/}{Citations note on Reactome website}
  }
}
\seealso{
\code{\link{rba_reactome_participant_of}}
}
\concept{"Reactome Content Service - Queries Related to Participants"}
