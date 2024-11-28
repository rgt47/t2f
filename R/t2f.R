#' Title: Function to export a dataframe or table to a pdf figure.
#'
#' Description: A detailed explanation of the function.
#'
#' @param df A dataframe or table to be exported.
#' @return NULL
#' @examples
#' t2f(iris, "iris", size = 10, width = "1in", rownames = FALSE)
#'
#' @export
t2f <- function(df, tabname, size = 10, width = "1in", rownames = FALSE,
                scolor = "gray!6", strps = NULL, pack = NULL, digits = 3,
                sub_dir = NULL) {
colnames(df) <- gsub("_", "\\\\_", colnames(df))
df[] <- lapply(df, function(x) gsub("%", "\\\\%", x))
        main_dir <- getwd()
        if (!is.null(sub_dir)) {
                if (!file.exists(sub_dir)) {
                        dir.create(file.path(main_dir, sub_dir))
                }
        }
        t1 <- kableExtra::kable({{ df }}, "latex",
                booktabs = TRUE, escape = FALSE,
                row.names = rownames, digits = digits
        ) |>
                kableExtra::kable_styling(
                        latex_options = "striped", stripe_color = scolor,
                        stripe_index = strps, font_size = size
                ) |>
                # pack = c(` ` = 3, `Group 1` = 2, `Group 2` = 1))
                # pack_rows(index = pack, latex_gap_space = ".15in") |>
                as.character()
        bname <- paste0("./", sub_dir, "/", tabname)
        prelude <- "\\documentclass[10pt]{article}
\\usepackage{amsmath,amssymb,booktabs,longtable,float,colortbl,xcolor,geometry}
\\begin{document}
\\thispagestyle{empty} "
        enddoc <- "\\end{document}"
        write(c(prelude, t1, enddoc), paste0(bname, ".tex"))
        xtx <- paste0(
                "xelatex --halt-on-error -jobname=", bname, "0 ",
                bname, " 1>sdout.tmp"
        )
        crp <- paste0(
                "pdfcrop -margins 10 ", bname, "0.pdf ",
                bname, ".pdf  1>sdout2.tmp"
        )
        rmf <- paste0("rm ", bname, "0.aux ", bname, "0.log ", bname, "0.pdf")
        sout <- system(xtx)
        sout2 <- system(crp, intern = TRUE)
        sout3 <- system(rmf, intern = TRUE)
        return(sout)
}
