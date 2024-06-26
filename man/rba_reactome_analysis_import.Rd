% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reactome_analysis.R
\name{rba_reactome_analysis_import}
\alias{rba_reactome_analysis_import}
\title{Import Saved Analysis JSON to Reactome}
\usage{
rba_reactome_analysis_import(input, input_format = NULL, ...)
}
\arguments{
\item{input}{A local file path or URL that points to your -optionally
gzipped- JSON file.}

\item{input_format}{(Optional) This function will automatically identify
your supplied input's format. But in case of unexpected issues or if you
want to be explicit, set this argument to one of:\itemize{
\item "file": If you supplied a local file path pointing to the JSON file.
\item "url": If you supplied a URL pointing to the JSON file.}}

\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
A list containing the new token and other information of your
  imported results.
}
\description{
If you have a JSON file of analysis results (only obtained via
  \code{\link{rba_reactome_analysis_download}} with the result argument
  set to "results", or "results_gz"), you can import the results back to
  Reactome and retrieve a token.
  \cr This is useful when you want to use other Reactome services which require
  a token but you do not have a token or your token has been
  expired (i.e. more than 7 days passed from your analysis).
}
\section{Corresponding API Resources}{

"GET https://reactome.org/AnalysisService/import/"
\cr "GET https://reactome.org/AnalysisService/import/form"
\cr "GET https://reactome.org/AnalysisService/import/url"
}

\examples{
\dontrun{
rba_reactome_analysis_import("c:/rbioapi/res.json")
}
\dontrun{
rba_reactome_analysis_import("https://qaz.com/res.json.gz")
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
  \item \href{https://reactome.org/AnalysisService/}{Reactome Analysis
  Services API Documentation}
  \item \href{https://reactome.org/cite}{Citations note on Reactome website}
  }
}
\seealso{
Other "Reactome Analysis Service": 
\code{\link{rba_reactome_analysis}()},
\code{\link{rba_reactome_analysis_download}()},
\code{\link{rba_reactome_analysis_mapping}()},
\code{\link{rba_reactome_analysis_pdf}()},
\code{\link{rba_reactome_analysis_species}()},
\code{\link{rba_reactome_analysis_token}()}
}
\concept{"Reactome Analysis Service"}
