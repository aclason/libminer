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
lib_summary <- function(sizes = FALSE){
  pkgs <- utils::installed.packages()
  pkg_tbl <- table(pkgs[, "LibPath"])
  pkg_df <- as.data.frame(pkg_tbl, stringsAsFactors = FALSE)
  names(pkg_df) <- c("library","n_packages")
  if (sizes) {
    pkg_df$lib_size <- vapply(
      pkg_df$library,
      function(x) {
        sum(fs::file_size(fs::dir_ls(x, recurse = TRUE)))
      },
      FUN.VALUE = double(1)
    )

  }

  pkg_df
}
