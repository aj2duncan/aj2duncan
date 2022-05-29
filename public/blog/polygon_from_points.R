# code to read in data frame of points and create a polygon from them
library(readr)
library(sf)

bounding_box <- read_csv("data/bounding_box.csv") %>%
  st_as_sf(coords = c("Longitude", "Latitude"), crs = "EPSG:4326") %>%
  st_transform(crs = st_crs(postcodes)) %>%
  st_combine() %>%
  st_cast(to = "POLYGON")


