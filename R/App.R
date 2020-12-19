#' The iNZight App object
#'
#' A class representing the current state of the application.
#'
#' @param data a data.frame object (or something that can be converted to one)
#' @param con a database connection
#' @param table if using `con`, this is the name of the table containing the data; if missing, iNZight will use the first (alphabetically) table in the schema
#'
#' @return an object of class 'inzstate', which can be parsed to JSON for piping to other applications (i.e., javascript)
#'
#' @author Tom Elliott
#'
#' @import R6
#' @export
#'
#' @examples
#' # the initial state on loading a default application is easy to obtain:
#' state <- inzight::App$new()
#'
#' # alternatively, some things may be specified:
#' state <- inzight::App$new(data = iris)
#'
#' @md
App <- R6::R6Class("App",
	public = list(
		data = NULL,
		con = NULL,
		table = NA_character_,
		initialize = function(data, con, table) {
			if (!missing(data)) self$data <- data
			if (!missing(con)) {
				self$con <- con
				if (!missing(table)) self$table <- table
				else {
					# figure out what the table name should be

				}
			}
		},
		finalize = function() {
			# stuff that happens when destroyed
		}
	)
)
