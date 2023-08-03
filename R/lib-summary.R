#' R library summary
#'
#' Provides a brief summary of package libraries
#'
#' @return a data.frame containing the count of pacakges in each of
#'    your libraries
#' @export
#'
#'
#'
#' @examples
#' \dontrun{
#' lib_summary()
#' }
lib_summary <- function(){
  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  names(pkg_df) <- c("library","n_packages")
  pkg_df
}
