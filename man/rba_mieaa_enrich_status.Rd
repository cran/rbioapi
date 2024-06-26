% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mieaa.R
\name{rba_mieaa_enrich_status}
\alias{rba_mieaa_enrich_status}
\title{Check Status of a Submitted Enrichment Analysis in miEAA}
\usage{
rba_mieaa_enrich_status(job_id, ...)
}
\arguments{
\item{job_id}{The job-id (a character string) of a submitted enrichment
analysis.}

\item{...}{rbioapi option(s). See \code{\link{rba_options}}'s
arguments manual for more information on available options.}
}
\value{
A list containing the status value for a analysis that corresponds
  to your supplied job-id.
}
\description{
After you have submitted your enrichment analysis (using
   \code{\link{rba_mieaa_enrich_submit}}) and retrieved a job-id,
  you can use this function to check the status of your job. Status value
  equal to 100 means that your requested analysis has finished and you may
  retrieve the results using \code{\link{rba_mieaa_enrich_results}}.
}
\details{
Note that using \code{\link{rba_mieaa_enrich}} is a more convenient way to
  automatically perform this and other required function calls to
  perform enrichment analysis on your input miRNA-set using miEAA.
}
\section{Corresponding API Resources}{

 "GET https://ccb-compute2.cs.uni-saarland.de/mieaa2/api/v1/job_status/\{job_id\}"
}

\examples{
\dontrun{
Sys.sleep(1) # to prevent 429 error during R CMD check
rba_mieaa_enrich_status("f52d1aef-6d3d-4d51-9020-82e68fe99012")
}

}
\references{
\itemize{
  \item Fabian Kern, Tobias Fehlmann, Jeffrey Solomon, Louisa Schwed,
  Nadja Grammes, Christina Backes, Kendall Van Keuren-Jensen,
  David Wesley Craig,Eckart Meese, Andreas Keller, miEAA 2.0:
  integrating multi-species microRNA enrichment analysis and workflow
  management systems, Nucleic Acids Research, Volume 48, Issue W1,
  02 July 2020, Pages W521–W528, https://doi.org/10.1093/nar/gkaa309
  \item
  \href{https://ccb-compute2.cs.uni-saarland.de/mieaa2/tutorial/api/}{miEAA
  browsable API tutorial}
  \item \href{https://ccb-compute2.cs.uni-saarland.de/mieaa2/}{Citations note
  on miEAA website}
  }
}
\seealso{
Other "miEAA": 
\code{\link{rba_mieaa_cats}()},
\code{\link{rba_mieaa_convert_type}()},
\code{\link{rba_mieaa_convert_version}()},
\code{\link{rba_mieaa_enrich}()},
\code{\link{rba_mieaa_enrich_results}()},
\code{\link{rba_mieaa_enrich_submit}()}
}
\concept{"miEAA"}
