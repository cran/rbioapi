% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stringdb.R
\name{rba_string_version}
\alias{rba_string_version}
\title{Get Current STRING Version}
\usage{
rba_string_version(...)
}
\arguments{
\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
A list with STRING version and stable address.
}
\description{
Get STRING version and stable Address that this package currently uses.
}
\details{
Note that STRING releases new version at approximately 2 years cycle.
  Nevertheless, to insure reproducibility, STRING dedicates a stable address
  for each release. Thus you can always reproduce research and results
  obtained via a certain STRING version. If the version that rbioapi returns
  is outdated, Kindly contact me.
}
\section{Corresponding API Resources}{

 "GET https://string-db.org/api/\{output_format\}/version"
}

\examples{
\donttest{
rba_string_version()
}

}
\references{
\itemize{
  \item Damian Szklarczyk, Rebecca Kirsch, Mikaela Koutrouli, Katerina
   Nastou, Farrokh Mehryary, Radja Hachilif, Annika L Gable, Tao Fang,
   Nadezhda T Doncheva, Sampo Pyysalo, Peer Bork, Lars J Jensen, Christian
   von Mering, The STRING database in 2023: protein–protein association
   networks and functional enrichment analyses for any sequenced genome of
   interest, Nucleic Acids Research, Volume 51, Issue D1, 6 January 2023,
   Pages D638–D646, https://doi.org/10.1093/nar/gkac1000
  \item \href{https://string-db.org/help/api/}{STRING API Documentation}
  \item
  \href{https://string-db.org/cgi/about?footer_active_subpage=references}{
  Citations note on STRING website}
  }
}
\seealso{
Other "STRING": 
\code{\link{rba_string_annotations}()},
\code{\link{rba_string_enrichment}()},
\code{\link{rba_string_enrichment_ppi}()},
\code{\link{rba_string_homology_inter}()},
\code{\link{rba_string_homology_intra}()},
\code{\link{rba_string_interaction_partners}()},
\code{\link{rba_string_interactions_network}()},
\code{\link{rba_string_map_ids}()},
\code{\link{rba_string_network_image}()}
}
\concept{"STRING"}
