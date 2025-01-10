# t2f: Convert Dataframes to LaTeX Tables with Ease

## Overview

The `t2f` package provides a simple and powerful way to convert R dataframes into professionally formatted LaTeX tables and generate cropped PDF outputs. This vignette will guide you through the package's key features and demonstrate its usage.

## Installation

You can install the `t2f` package from your local repository or through GitHub (once published). Make sure you have the following dependencies:

- `kableExtra`
- `glue`
- `pdflatex`
- `pdfcrop`

```r
# Install dependencies first
install.packages(c("kableExtra", "glue"))

# Then install t2f
# devtools::install_github("your-username/t2f")
```

## Basic Usage

The primary function of the package is `t2f()`, which takes a dataframe and converts it to a LaTeX table with optional styling.

### Simple Example

```r
# Load the package
library(t2f)

# Use the built-in mtcars dataset
t2f(mtcars, 
    filename = "motor_trend_cars", 
    sub_dir = "tables", 
    scolor = "blue!10", 
    verbose = TRUE)
```

This code will:
1. Convert the `mtcars` dataframe to a LaTeX table
2. Create a "tables" subdirectory
3. Generate a PDF with blue-tinted alternating row colors
4. Print progress messages

### Customization Options

The `t2f()` function offers several parameters:

- `df`: The dataframe you want to convert (required)
- `filename`: Base name for output files (optional, defaults to dataframe name)
- `sub_dir`: Subdirectory for output files (default: "output")
- `scolor`: LaTeX color for row shading (default: "blue!10")
- `verbose`: Print progress messages (default: FALSE)

## Advanced Features

### Column Name Sanitization

The package automatically sanitizes column names to ensure compatibility with LaTeX and file systems. Special characters are replaced with underscores.

### Cell Content Sanitization

Special LaTeX characters like #, %, &, $, are automatically escaped to prevent compilation errors.

## Error Handling

The package includes robust error checking:
- Ensures input is a non-empty dataframe
- Checks for required dependencies
- Provides informative error messages

## Troubleshooting

### Common Issues
- Ensure `pdflatex` and `pdfcrop` are installed on your system
- Check that you have write permissions in the specified subdirectory
- Verify that all required LaTeX packages are available

## Examples

### Academic Dataset

```r
# Using an academic performance dataset
academic_data <- data.frame(
  Student = c("Alice", "Bob", "Charlie"),
  Math = c(95, 88, 92),
  Science = c(90, 85, 93),
  English = c(88, 92, 86)
)

t2f(academic_data, 
    filename = "student_scores", 
    scolor = "green!10")
```

### Financial Data

```r
# Hypothetical financial performance data
financial_data <- data.frame(
  Quarter = c("Q1 2023", "Q2 2023", "Q3 2023"),
  Revenue = c(1000000, 1250000, 1500000),
  Expenses = c(800000, 900000, 1000000),
  Profit = c(200000, 350000, 500000)
)

t2f(financial_data, 
    filename = "quarterly_financials", 
    scolor = "red!10", 
    verbose = TRUE)
```

## Conclusion

The `t2f` package simplifies the process of converting R dataframes to professional LaTeX tables. With built-in sanitization, styling, and PDF generation, it's an essential tool for researchers, academics, and data professionals.

## Package Information

- **Version**: 0.1.0
- **Author**: Ronald G. Thomas
- **License**: [Specify License]

## Contact

For issues, suggestions, or contributions, please visit the package repository.
