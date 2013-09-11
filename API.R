metrica.traffic <- xmlParse("http://api-metrika.yandex.ru/stat/traffic/summary?id=13044085&date1=20130801&date2=20130901&per_page=100&pretty=1&oauth_token=2eec9d0e55bb4cddb69227ffa7fb05e0")
metrica.phrases <- xmlParse("http://api-metrika.yandex.ru/stat/sources/phrases?id=13044085&date1=20130801&date2=20130901&pretty=1&oauth_token=2eec9d0e55bb4cddb69227ffa7fb05e0")
data.traffic <- xmlToDataFrame(metrica.traffic,
                            collectNames=FALSE,
                            nodes=xmlChildren(xmlRoot(metrica.traffic)[["data"]]))
data.phrases <- xmlToDataFrame(metrica.phrases,collectNames=FALSE,
                               nodes=xmlChildren(xmlRoot(metrica.phrases)[["data"]]))