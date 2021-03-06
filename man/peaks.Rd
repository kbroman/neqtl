\name{peaks}
\alias{peaks}
\title{
Proximity of Maximum LOD position to Transcript Location
}
\description{
Determines distance between position of maximum LOD score and trait
position, based on annotation.  Assigns CIS/Trans status based on a
window size (default=5)
}
\usage{
peaks(maxlod.out, sigpos.out, annot, win = 5)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{maxlod.out}{
Output from \code{\link{maxlod}} function
}
  \item{sigpos.out}{
Output from \code{\link{maxlod.sigpos}} function
}
  \item{annot}{
    A data.frame consisting of two columns:
    \code{chr} (Chromosome name, as a factor, with levels in the same
      order as the original \code{\link{scanone}} object.  Additional
      levels may be added at the end) and 
    \code{pos} (Position of trait in the same units as
      \code{\link{scanone}} object).
     The rownames should be the trait IDs, same as pheno names in original
       cross object.}
  \item{win}{Window size, in same units as \code{scanone} object
    (e.g. cM or Mb)}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
Returns a list corresponding to the number of chromosomes:
 \item{maxpos}{List of maximum LOD positions, named by trait, with
   existing location in annotation}
 \item{maxlods}{List of maximum LOD scores, named by trait, with
   existing location in annotation}
 \item{maxpos.cis}{List of maximum LOD positions, named by trait,
   within +/- 1/2 window size of annotation location}
 \item{maxpos.vaguelycis}{List of maximum LOD positions, named by
   trait, on the same chromosome as annotation location}
 \item{maxpos.forsuretrans}{List of maximum LOD positions, named by
   trait, on different chromosome as annotation location}
 \item{maxpos.trans}{List of maximum LOD positions, named by trait,
   outside of +/- 1/2 window size, or on different chromosome of
   annotation location} 
 \item{maxlods.cis}{List of maximum LOD scores, named by trait,
   within +/- 1/2 window size of annotation location}
 \item{maxlods.trans}{List of maximum LOD scores, named by trait,
   outside of +/- 1/2 window size, or on different chromosome of
   annotation location} 
 \item{maxpos.trait}{List of annotation positions, named by trait}
 \item{peaks}{\code{data.frame} of traits with maximum lod score (by
   chromosome) higher than a significance threshold (as defined in
   \code{\link{maxlod.sigpos}}), columns named "peaks" refer
   to linkage, columns named "trait" refer to annotation.  This object
   can be used for plotting.}
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Karl W. Broman and Aimee Teo Broman
}
%\note{
%%  ~~further notes~~
%}

\seealso{
  \code{\link{plotpeaks}}
}
\examples{
data(fake.f2expr)
fake.f2expr <- calc.genoprob(fake.f2expr)

scan.f2 <- scanone(fake.f2expr,pheno.col=1:100, method="hk")
maxlod.f2 <- maxlod(scan.f2)
sigpos.f2 <- maxlod.sigpos(maxlod.f2,sig.lod=3)

## Fake annotation ##
data(fake.annot)

peaks.f2 <- peaks(maxlod.f2,sigpos.f2,fake.annot)

}