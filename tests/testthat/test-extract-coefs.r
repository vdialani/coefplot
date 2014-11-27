context("ExtractCoefficients")

# we need data
data("tips", package="reshape2")
mod1 <- lm(tip ~ total_bill, data=tips)
mod2 <- lm(tip ~ total_bill + sex, data=tips)
mod3 <- lm(tip ~ total_bill + sex + smoker, data=tips)
mod4 <- lm(tip ~ total_bill + sex*smoker, data=tips)
mod5 <- lm(tip ~ total_bill + sex:smoker, data=tips)
mod6 <- lm(tip ~ total_bill*sex, data=tips)
mod7 <- lm(tip ~ sex*smoker, data=tips)

coef1 <- extract.coef(mod1)
coef2 <- extract.coef(mod2)
coef3 <- extract.coef(mod3)
coef4 <- extract.coef(mod4)
coef5 <- extract.coef(mod5)
coef6 <- extract.coef(mod6)
coef7 <- extract.coef(mod7)

tips$Threshold <- tips$tip >= 4.5
modG1 <- glm(Threshold ~ total_bill, data=tips, family=binomial(link="logit"))
modG2 <- glm(Threshold ~ total_bill + sex, data=tips, family=binomial(link="logit"))
modG3 <- glm(Threshold ~ total_bill + sex + smoker, data=tips, family=binomial(link="logit"))
modG4 <- glm(Threshold ~ total_bill + sex*smoker, data=tips, family=binomial(link="logit"))
modG5 <- glm(Threshold ~ total_bill + sex:smoker, data=tips, family=binomial(link="logit"))
modG6 <- glm(Threshold ~ total_bill*sex, data=tips, family=binomial(link="logit"))
modG7 <- glm(Threshold ~ sex*smoker, data=tips, family=binomial(link="logit"))

coefG1 <- extract.coef(modG1)
coefG2 <- extract.coef(modG2)
coefG3 <- extract.coef(modG3)
coefG4 <- extract.coef(modG4)
coefG5 <- extract.coef(modG5)
coefG6 <- extract.coef(modG6)
coefG7 <- extract.coef(modG7)

test_that("Coefficients come as data.frames", {
    expect_is(coef1, "data.frame")
    expect_is(coef2, "data.frame")
    expect_is(coef3, "data.frame")
    expect_is(coef4, "data.frame")
    expect_is(coef5, "data.frame")
    expect_is(coef6, "data.frame")
    expect_is(coef7, "data.frame")
    
    expect_is(coefG1, "data.frame")
    expect_is(coefG2, "data.frame")
    expect_is(coefG3, "data.frame")
    expect_is(coefG4, "data.frame")
    expect_is(coefG5, "data.frame")
    expect_is(coefG6, "data.frame")
    expect_is(coefG7, "data.frame")
})

test_that("Coefficients have proper dimenions", {
    expect_equal(dim(coef1), c(2, 3))
    expect_equal(dim(coef2), c(3, 3))
    expect_equal(dim(coef3), c(4, 3))
    expect_equal(dim(coef4), c(5, 3))
    expect_equal(dim(coef5), c(5, 3))
    expect_equal(dim(coef6), c(4, 3))
    expect_equal(dim(coef7), c(4, 3))
    
    expect_equal(dim(coefG1), c(2, 3))
    expect_equal(dim(coefG2), c(3, 3))
    expect_equal(dim(coefG3), c(4, 3))
    expect_equal(dim(coefG4), c(5, 3))
    expect_equal(dim(coefG5), c(5, 3))
    expect_equal(dim(coefG6), c(4, 3))
    expect_equal(dim(coefG7), c(4, 3))
})

test_that("Coefficients have proper types", {
    expect_equal(sapply(coef1, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coef2, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coef3, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coef4, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coef5, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coef6, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coef7, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    
    expect_equal(sapply(coefG1, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coefG2, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coefG3, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coefG4, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coefG5, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coefG6, class), c(Value="numeric", SE="numeric", Coefficient="character"))
    expect_equal(sapply(coefG7, class), c(Value="numeric", SE="numeric", Coefficient="character"))
})
