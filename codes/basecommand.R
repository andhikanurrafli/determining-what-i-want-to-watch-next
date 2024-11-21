# setting the environment

library(tidyverse)
library(knitr)

# loading data

appletv_data <- read.csv("data.csv")



# cleaning data


appletv_data <- appletv_data %>% 
  rename(rating = imdbAverageRating)

appletv_data <- appletv_data %>% 
  rename(votes = imdbNumVotes)



top_movie <- appletv_data %>% 
  group_by(title, rating) %>% 
  filter(rating >= 8.0, votes >= 800000)

top_10 <- top_movie %>% 
  arrange(desc(rating)) %>% 
  head(10)

# splitting data

appletv_data <- appletv_data %>% 
  separate(genres, into = c("genre 1","genre 2", "genre 3"), sep = ", ")


genres <- as.data.frame(table(appletv_data$`genre`))
colnames(genres) <- c("Genre", "Frequency")

ggplot(data = appletv_data) + 
  geom_bar(mapping = aes(x = "genre 1", fill = `genre 1`))+
  labs(title = "Count of Genres",
       x = "Genre",
       y = "Count")




