# Plots Script
# Generates actual vs forecast plots for all methods

save_plot <- function(filename, actual_ts, fitted_vals,
                      title, legend_labels, colors) {
  png(paste0("outputs/figures/", filename), width=1000, height=500)
  plot(actual_ts, main=title, ylab="Visitors",
       xlab="Time", col=colors[1], lwd=1.5)
  lines(ts(fitted_vals, start=start(actual_ts), frequency=frequency(actual_ts)),
        col=colors[2], lwd=1.5, lty=2)
  legend("topleft", legend=legend_labels,
         col=colors, lty=c(1,2), lwd=2)
  grid()
  dev.off()
}

