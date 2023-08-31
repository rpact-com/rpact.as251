

test_that("sigmaToBPD works correctly", {
    bpd <- c(0.3, 0.4, 0.5) 
    sigma <- bpd %*% t(bpd)
    diag(sigma) <- 1
    for (i in 1:10000) {
        n <- 9
        bpd <- runif(n, 0, 5)
        sigma <- bpd %*% t(bpd)
        diag(sigma) <- 1  
        expect_equal(sigmaToBPD(sigma), bpd, tolerance = 1e-12)
    }
})
