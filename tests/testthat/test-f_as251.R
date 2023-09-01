test_that("mvnprd and sadmvn are equal", {
    A <- rep(2, 3)
    B <- rep(-3, 3)
    BPD <- sqrt(c(0.3, 0.4, 0.5))
    eps <- 1e-06
    INF <- rep(2, 3)
    ierc <- 0
    hinc <- 0
    x1 <- mvnprd(A = A, B = B, BPD = BPD, EPS = eps, INF = INF, IERC = ierc, HINC = hinc)

    sigma <- BPD %*% t(BPD)
    diag(sigma) <- 1

    x2 <- mnormt::sadmvn(lower = B, upper = A, mean = 0, varcov = sigma)
    expect_equal(x1[1], x2[1], tolerance = eps)
})


test_that("mvnprd and sadmvn are equal", {
    A <- rep(2, 3)
    B <- rep(-3, 3)
    BPD <- sqrt(c(0.3, 0.4, 0.5))
    eps <- 1e-06
    INF <- rep(2, 3)
    ierc <- 0
    hinc <- 0
    x1 <- mvnprd(A = A, B = B, BPD = BPD, EPS = eps, INF = INF, IERC = ierc, HINC = hinc)

    sigma <- BPD %*% t(BPD)
    diag(sigma) <- 1

    x2 <- mnormt::sadmvn(lower = B, upper = A, mean = 0, varcov = sigma)
    
    
    x3 <- as251Normal(lower = 2, upper = -3, sigma = sigma, inf = INF, eps = eps, ierc = ierc, hinc = 0)
    
    expect_equal(x1[1], x2[1], tolerance = eps)
    expect_equal(x1[1], x3[1], tolerance = eps)
})
