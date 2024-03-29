% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reactome_content.R
\name{rba_reactome_species}
\alias{rba_reactome_species}
\title{Get Reactome Species}
\usage{
rba_reactome_species(only_main = FALSE, ...)
}
\arguments{
\item{only_main}{Logical: If set to TRUE, will only return species which
have either manually-curated or computationally inferred pathways.}

\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
Data frame where each row is a species and columns are pertinent
  information.
}
\description{
Use this function to retrieve a table of Available species in Reactome.
}
\section{Corresponding API Resources}{

 "GET https://reactome.org/ContentService/data/species/all"
 \cr "GET https://reactome.org/ContentService/data/species/main"
}

\examples{
\donttest{
rba_reactome_species()
}
\donttest{
rba_reactome_species(only_main = TRUE)
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
\concept{"Reactome Content Service - Species Related Queries"}
