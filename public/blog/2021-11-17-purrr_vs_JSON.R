library(repurrrsive)
library(jsonlite) 

sw_films %>%
  toJSON() %>%
  fromJSON() %>% 
  unnest(c(title, episode_id, opening_crawl, director, producer, 
           release_date, created, edited, url))


# doesn't work for list columns
map_df(sw_films, extract, c("title", "episode_id", "opening_crawl", "director", 
                            "producer", "release_date", "characters", "planets",
                            "starships", "vehicles", "species", "created", 
                            "edited", "url"))
