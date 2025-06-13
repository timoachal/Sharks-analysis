````markdown name=README.md
# Sharks Analysis

This project contains a brief **Exploratory Data Analysis (EDA)** of a shark attack dataset using R. The analysis focuses on cleaning the data, transforming variables for easier analysis, and visualizing some key features of shark attack incidents worldwide.

## Dataset

The dataset (`Sharks.csv`) contains records of shark attack incidents, including information such as date, location, type of incident, victim details, and outcomes. The data was imported using:

```r
Sharks <- read.csv("E:/data sets/Sharks.csv")
```

## Libraries Used

- `tidyverse` for data manipulation and visualization
- `gtExtras` for enhanced table display
- `naniar`, `mice` for missing data handling
- `readr` for reading CSV files

## Data Cleaning and Transformation

Several preprocessing steps were performed to prepare the data for analysis:

- **Column Selection:** Removed unnecessary columns to keep only relevant information such as case number, date, year, type of incident, location, activity, victim's name, sex, age, injury, fatality, time, species, and region.
- **Type Encoding:** The `Type` column was recoded into numeric categories (e.g., "Unprovoked" → 1, "Provoked" → 2, etc.) for easier analysis.
- **Sex Encoding:** The `Sex` column was simplified to binary values ("M" → 0, all others → 1).
- **Fatality Encoding:** The `Fatal..Y.N.` field was also converted to binary labels ("N" → 0, all others → 1).
- **Column Renaming:** The `Country` column was renamed to `region` for consistency with mapping data.
- **Handling Missing Data:** Rows with missing `region` values were dropped to improve data quality.

## Exploratory Data Analysis

### Data Structure & Summary

```r
str(Sharks)
summary(Sharks)
class(Sharks)
```
- Inspected the structure and summary statistics of the raw data to understand the types and distributions of variables.

### Data Table Preview

A sample of the cleaned dataset was displayed in a formatted table using the `gt` package:

```r
Newsharks %>%
  head(15) %>%
  gt() %>%
  gt_theme_guardian() %>%
  tab_header(title = "Sharks characters")
```

### Unique Values

Checked the unique values in key columns (e.g., incident types):

```r
unique(Newsharks$Type)
```

### Mapping

Joined the cleaned shark data with world map data for potential geographic visualizations:

```r
mapdata <- map_data("world")
mapdata <- left_join(mapdata, Newsharks %>% select(region, Age), by = "region")
```

## Next Steps

- Visualize the geographic distribution of shark attacks.
- Analyze the relationship between victim characteristics and outcomes.
- Explore trends over time and by region.

---

**Note:**  
This EDA serves as a foundation for deeper statistical and visualization work on shark attack patterns globally.
````
