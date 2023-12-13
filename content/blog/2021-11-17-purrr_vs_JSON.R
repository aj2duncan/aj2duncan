library(repurrrsive)
library(tidyverse)
library(jsonlite) 

sw_films |>
  toJSON() |>
  fromJSON() |> 
  unnest(c(title, episode_id, opening_crawl, director, producer, 
           release_date, created, edited, url))


# doesn't work for list columns
map_df(sw_films, extract, c("title", "episode_id", "opening_crawl", "director", 
                            "producer", "release_date", "characters", "planets",
                            "starships", "vehicles", "species", "created", 
                            "edited", "url"))
map_df(sw_films, pluck, "title", "episode_id")
pluck(sw_films, 1)

sw_films |>
  unnest(c(title, episode_id, opening_crawl, director, producer, 
           release_date, created, edited, url))


test = list(
  list(id = "a", created = Sys.Date(), values = list(1, 2,3)),
  list(id = "b", created = Sys.Date(), values = list(4, 5, 6))
)

test |>
  toJSON(pretty = TRUE) |>
  fromJSON() |>
  unnest(c(id, created))
