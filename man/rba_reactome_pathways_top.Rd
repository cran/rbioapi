% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reactome_content.R
\name{rba_reactome_pathways_top}
\alias{rba_reactome_pathways_top}
\title{Get Top Level Pathways in a Species}
\usage{
rba_reactome_pathways_top(species, ...)
}
\arguments{
\item{species}{Numeric or Character: NCBI Taxonomy identifier (Human Taxonomy
ID is 9606.) or species name (e.g. "Homo sapiens"). See
\code{\link{rba_reactome_species}} or
\href{https://reactome.org/content/schema/objects/Species/}{Reactome
Data Schema: Entries: Species}.}

\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
Data frame where each row is a Top Level Pathway and columns are
  pertinent information.
}
\description{
This function will Return a list of all pathways with the class
  "TopLevelPathway" which are annotated in your supplied species.
}
\details{
Reactome's Events hierarchy for any specie will begin with pathways with
  class "TopLevelPathway" (e.g. "Immune System", "Metabolism of proteins").
  further down in the event's hierarchy tree, each TopLevelPathway has
  has other events itself (e.g. "Adaptive immune system", "Innate immune
  system"). Based on the chosen pathway, the hierarchy tree would typically
  goes further down.
}
\section{Corresponding API Resources}{

 "GET https://reactome.org/ContentService/data/pathways/top/\{species\}"
}

\examples{
\donttest{
rba_reactome_pathways_top(species = 9606)
}
\donttest{
rba_reactome_pathways_top(species = "Saccharomyces cerevisiae")
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
Other "Reactome Content Service - Pathway Related Queries": 
\code{\link{rba_reactome_pathways_events}()},
\code{\link{rba_reactome_pathways_low}()}
}
\concept{"Reactome Content Service - Pathway Related Queries"}
