#' Title: Function to export a dataframe or table to a pdf figure. 
#'
#' Description: A detailed explanation of the function.
#'
#' @param df A dataframe or table to be exported.
#' @return NULL 
#' @examples
#' t2f(df)
#' 
#' @export
t2f <- function(df, tabname, size = 10, width = "1in", rownames = FALSE,
                   scolor = "gray!6", strps = NULL, pack = NULL, digits = 3) {
        main_dir <- getwd()
        sub_dir <- "tables"
        if (!file.exists(sub_dir)) {
                dir.create(file.path(main_dir, sub_dir))
        }
        t1 <- kable({{ df }}, "latex",
                booktabs = TRUE, escape = FALSE,
                row.names = rownames, digits = digits
        ) %>%
                kable_styling(
                        latex_options = "striped", stripe_color = scolor,
                        stripe_index = strps, font_size = size
                ) |>
                as.character()
        # pack_rows(index = pack, latex_gap_space = ".15in") %>%
        write(t1, paste0("./tables/", tabname, ".tex"))
        system(paste0("sh ~/shr/figurize.sh ./tables/", tabname, ".tex"))
}
