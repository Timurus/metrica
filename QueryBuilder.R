#Basic query for phrases and traffic
QueryBuilder <- function() {
  
  start.date   <- NULL
  end.date     <- NULL
  profile.id   <- NULL
  access_token <- NULL
  
  StartDate <- function(start.date.param = NA) {
    # Sets the start date.
    # Optional.
    # All Analytics feed requests must specify a beginning and ending date
    # range. If you do not indicate start- and end-date values for the
    # request, the server returns a request error.
    # Date values are in the form YYYY-MM-DD.
    # The earliest valid start-date is 2005-01-01. There is no upper limit
    # restriction for a start-date. However, setting a start-date that is
    # too  far in the future will most likely return empty results.
    #
    #  Args:
    #    start.date.param: Optional. A start date of the form "YYYY-MM-DD"
    #                      as a string. If NULL is used, the start.date
    #                      parameter will be unset. If no parameter is
    #                      specified, the current start.date value is
    #                      returned.
    #
    #  Returns:
    #    The start.date value if start.date.param is not set.
    # Un-set the parameter if the value NULL is used.
    if (is.null(start.date.param)) {
      start.date <<- NULL
      return(invisible())
    }
    
    # Returns the current dimension value if no parameter is used.
    if (is.na(start.date.param)) {
      return(start.date)
    }
    
    # Error handling.
    # Check the form of the start.date.param.
    if (is.na(as.Date(start.date.param, "%Y%m%d"))) {
      stop("A start date must be specified of the form YYYYMMDD")
    }
    
    start.date <<- start.date.param
    return(invisible())
  }
  
  EndDate <- function(end.date.param = NA) {
    # Sets the end date.
    # Optional.
    # All Analytics feed requests must specify a beginning and ending date
    # range. If you do not indicate start- and end-date values for the
    # request, the server returns a request error.
    # Date values are in the form YYYY-MM-DD.
    # The earliest valid start-date is 2005-01-01. There is no upper limit
    # restriction for a start-date. However, setting a start-date that is
    # too far in the future will most likely return empty results.
    #
    #  Args:
    #    end.date.param: An end date of the form 'YYYY-MM-DD'
    #                    as a string. If NULL is used, the end.date.param
    #                    parameter will be unset. If no parameter is specified,
    #                    the current end.date value is returned.
    #
    #  Returns:
    #    The end.date value if end.date.param is not set.
    
    # Un-set the parameter if the value NULL is used.
    if (is.null(end.date.param)) {
      end.date <<- NULL
      return(invisible())
    }
    
    # Returns the current dimension value if no parameter is used.
    if (is.na(end.date.param)) {
      return(end.date)
    }
    
    # Error handling.
    # Check the form of the end.date.param.
    if (is.na(as.Date(end.date.param, "%Y%m%d"))) {
      stop("An end date must be specified of the form YYYYMMDD")
    }
    
    end.date <<- end.date.param
    return(invisible())
  }
  
  
}