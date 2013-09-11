library("RCurl")

#Basic query for phrases and traffic
QueryBuilder <- function() {
  
  start.date   <- NULL
  end.date     <- NULL
  profile.id   <- NULL
  access_token <- NULL
  method       <- NULL
  
  StartDate <- function(start.date.param = NA) {
    
    if (is.null(start.date.param)) {
      start.date <<- NULL
      return(invisible())
    }
    
    if (is.na(start.date.param)) {
      return(start.date)
    }
    
    if (is.na(as.Date(start.date.param, "%Y%m%d"))) {
      stop("A start date must be specified of the form YYYYMMDD")
    }
    
    start.date <<- start.date.param
    return(invisible())
  }
  
  EndDate <- function(end.date.param = NA) {
  
    if (is.null(end.date.param)) {
      end.date <<- NULL
      return(invisible())
    }
    
    if (is.na(end.date.param)) {
      return(end.date)
    }
    
    if (is.na(as.Date(end.date.param, "%Y%m%d"))) {
      stop("An end date must be specified of the form YYYYMMDD")
    }
    
    end.date <<- end.date.param
    return(invisible())
  }
  
  Profile <- function(profile.id.param = NA){
    
    if (is.null(profile.id.param)) {
      profile.id <<- NULL
      return(invisible())
    }
    
    if(is.na(profile.id.param)){
      return(profile.id)
    }
    
    profile.id <<-profile.id.param
    return(invisible())
  }
  
  AccessToken <- function(access_token.param){
    if (is.null(access_token.param)) {
      access_token <<- NULL
      return(invisible())
    }
    
    if(is.na(access_token.param)){
      return(access_token)
    }
    
    access_token <<-access_token.param
    return(invisible())
  }
  
  #Function for choosing method for Yandex Metrica API
  Method <- function(method.param){
    
    if(method.param == 1)
      method <<- "traffic/summary?"
    else
      method <<- "sources/phrases?"
    
    return(invisible())
  }
  
  ClearData <- function() {
  
    start.date  <<- NULL
    end.date    <<- NULL
    method      <<- NULL
    profile.id  <<- NULL
    access_token <<- NULL
    return(invisible())
  }
  
  ToUri <- function() {
    
    query <- c("profile.id"  = profile.id,
               "start.date"  = start.date,
               "end.date"    = end.date,
               "access_token" = access_token)
    
    uri <- paste("http://api-metrika.yandex.ru/stat/",method,"pretty=1&",collapse=NULL)
    for (name in names(query)) {
      uri.name <- switch(name,
                         profile.id = "id",
                         start.date  = "date1",
                         end.date    = "date2",
                         access_token = "oauth_token")
      
      if (!is.null(uri.name)) {
        uri <- paste(uri,
                     uri.name,
                     "=",
                     curlEscape(query[[name]]),
                     "&",
                     sep = "",
                     collapse= "")
      }
    }

    uri <- sub("&$", "", uri)
    
    uri <- gsub("\\s", "", uri)
    
    return(uri)
  }
  
  Init <- function(profile.id = NULL,
                   start.date  = NULL,
                   end.date    = NULL,
                   method = NULL,
                   access_token = NULL) {
    
    StartDate(start.date)
    EndDate(end.date)
    Profile(profile.id)
    AccessToken(access_token)
    Method(method)
    
    return(invisible())
  }
  
  return(list("start.date"     =   StartDate,
              "end.date"     =   EndDate,
              "profile.id"      = Profile,
              "method"       = Method,
              "to.uri"       =   ToUri,   
              "clear.data"   =   ClearData,
              "access_token" =   AccessToken,			  
              "Init"         =   Init))
  
}

q <- QueryBuilder()
q$Init(start.date="20130801",end.date="20130901", profile.id="13044085",method=1,access_token="2eec9d0e55bb4cddb69227ffa7fb05e0")

