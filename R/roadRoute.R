# roadRoute -------------------------------------------------------------------
#' Road route information
#'
#' Get road route information in local with GraphHopper and OpenStreetMap.
#'
#' @param from c(latitude, longitude)
#' @param to c(latitude, longitude)
#' @param weighting "shortest" or "fastest" (default)
#' @param calc_points TRUE or FALSE (default)
#'
#' @return Distance in km, time in minutes and, if asked, intermediate points.
#'
#' @example
#' pontevedra <- c(42.4338555, -8.6743651)
#' coruna <- c(43.3618728, -8.4301933)
#' roadRoute(from = pontevedra, to = coruna, weighting = "fastest")
#' roadRoute(from = pontevedra, to = coruna, weighting = "shortest")
#' roadRoute(from = pontevedra, to = coruna, calc_points = TRUE)

roadRoute <- function(from, to, weighting = "fastest", calc_points = FALSE) {

  # Options
  op <- paste0("&locale=es&instructions=false&weighting=", weighting)
  op <- paste0(op, "&calc_points=", calc_points, "&points_encoded=false")

  # Request
  request <- paste("http://localhost:8989/route?point=",
                   paste(from[1], from[2], sep = ","), "&point=",
                   paste(to[1], to[2], sep = ","),
                   op, sep="")

  # Get JSON
  result <- try(getURL(URLencode(request)), silent=TRUE)

  # Extract data from JSON
  km <- fromJSON(result)$paths[[1]]$distance / 1000
  min <- fromJSON(result)$paths[[1]]$time / (1000 * 60)

  if (calc_points == TRUE) {
    points <- ldply(fromJSON(result)$paths[[1]]$points$coordinates, rbind)
    return(list(distance = km, time = min, points = points))
  } else {
    return(list(distance = km, time = min))
  }

}
# --------------------------------------------------------------------------- #
