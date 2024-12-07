ftest <- function(df, filename = deparse(substitute(df))) {
        colnames(df) <- sanitize_column_names(names(df))
        return(filename)
}

sanitize_column_names <- function(colnames) {
        gsub("[^a-zA-Z0-9_]", "_", make.names(colnames))
}

