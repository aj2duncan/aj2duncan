dat_cols <- map_df(list_of_data_frames, ncol) %>% 
  pivot_longer(everything(), names_to = "Dataset", values_to = "Number of columns")

dat_rows <- map_df(list_of_data_frames, ncol) %>% 
  pivot_longer(everything(), names_to = "Dataset", values_to = "Number of rows")

inner_join(dat_cols, dat_rows) %>%
  mutate(ID = row_number(), .before = Dataset)


list_of_data_frames <- list("diamonds" = diamonds, "economics" = economics,
                            "economics long" = economics_long)

exec(list(ncol, nrow), list_of_data_frames)
list_of_data_frames %>%
  map_df(~ list("Number of columns" = ncol, "Number of rows" = nrow) %>%
         map(exec, .x), .id = "Dataset")
