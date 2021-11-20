# AFT model:

<img src="https://render.githubusercontent.com/render/math?math=log(T_i) = \beta_0 %2B\beta_1 x_{i1} %2B\ldots %2B\beta_p x_{ip} %2B\sigma\epsilon_i">

* <img src="https://render.githubusercontent.com/render/math?math=\sigma"> is scale parameter. 
* <img src="https://render.githubusercontent.com/render/math?math=\epsilon_i"> is random disturbance
* Note: The scale parameter is the reciprocal of the shape parameter.

| <img src="https://render.githubusercontent.com/render/math?math=\epsilon_i"> distribution | T distribution | Lifereg syntax         | Notes
| --- | --- | ---- | ----
| extreme value(2 params)| Weibull        | dist = Weibull     | ?
| extreme val(1 param)| exponential     | dist = exponential | ?
| log-gamma           | gamma           | dist = gamma       | ?
| logistic            | log-logistic    | dist = llogistic   | ?
| normal              | log-normal      | dist = lnormal     | ?

Interpretation of the regression coefficients:

if we increase the covariate value of <img src="https://render.githubusercontent.com/render/math?math=\x_k"> by one
unit while holding other covariate values unchanged, the corresponding average survival time will increase by
a factor of <img src="https://render.githubusercontent.com/render/math?math=exp(\beta_k)">.


REFERENCES

[Applied Survival Analysis: Parametric Survival Analysis using R](https://rstudio-pubs-static.s3.amazonaws.com/5564_bc9e2d9a458c4660aa82882df90b7a6b.html