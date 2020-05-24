df=read.csv('/Users/leahm/Documents/R/Parkinsons Data/PSY6422 project/summary_tappy_data.csv', sep=',', header =TRUE)
Parkinsons_cleaned <- na.omit(typingmeandata)
rank_comparison <- df %>% select('Parkinsons', 'typing_mean')
> typingmeandata <- df %>% select('Parkinsons', 'typing_mean')
> View(typingmeandata)
typingmeandata <- mutate(typingmeandata, Result = ifelse('Has Parkinsons', 'No Parkinsons'))
typingmeandata <- mutate(typingmeandata, Result = ifelse('Parkinsons'=='True', 'Has Parkinsons', 'No Parkinsons'))
typingmeandata <- mutate(typingmeandata, State = ifelse(Parkinsons == 'True', "Has Parkinsons", "No Parkinsons"), )
View(typingmeandata)
Parkinsons_cleaned <- na.omit(typingmeandata)
typingmeandata <- df %>% select('Parkinsons', 'typing_mean', 'hold_std')
typingmeandata <- mutate(typingmeandata, State = ifelse(Parkinsons == 'True', "Has Parkinsons", "No Parkinsons"), )
> #Remove NA values
  > parkinsons_cleaned <- na.omit(typingmeandata)
> #Remove STD Outliers
  > parkinsons_cleaned_outliersremoved <- parkinsons_cleaned[!(parkinsons_cleaned$hold_std > 100),]
> #create table
  parkinsons_table = data.table(parkinsons_cleaned_outliersremoved)
> #group table to show averages table
  > parkinsons_table[,mean(typing_mean), by = 'State']
State       V1
1: Has Parkinsons 354.3253
2:  No Parkinsons 358.0589
p1 <- ggplot(parkinsons_cleaned_outliersremoved, aes(x = Parkinsons, y = typing_mean))
> p1 + geom_point(color = "yellow")
ggplot(data = parkinsons_cleaned_outliersremoved, mapping = aes(x = Parkinsons, y = typing_mean, color = Parkinsons)) + geom_point() + ggtitle("Parkinsons Means")
ggplot(data = parkinsons_cleaned_outliersremoved, mapping = aes(x = Parkinsons, y = typing_mean, color = Parkinsons)) + geom_point() + ggtitle("Differences in average typing latency (ms) in participants with Parkinson's Disease vs those without.") + xlab("Parkinsons Diagnosis") + ylab("Average typing latency (ms)")