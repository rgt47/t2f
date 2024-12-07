ftest <- function(df) {
    # Capture the name of the argument passed to 'df' as a string
    filename <- deparse(substitute(df))
    
    # Perform column name sanitization without altering 'filename'
    colnames(df) <- sanitize_column_names(names(df))
    
    # Return the original name of 'df'
    return(filename)
}

sanitize_column_names <- function(colnames) {
    # Replace invalid characters in column names with underscores
    gsub("[^a-zA-Z0-9_]", "_", make.names(colnames))
}

