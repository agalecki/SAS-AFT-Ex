# AFT model:

<img src="https://render.githubusercontent.com/render/math?math=log(T_i) = \beta_0 %2B\beta_1 x_{i1} %2B\ldots %2B\beta_p x_{ip} %2B\sigma\epsilon_i">

* <img src="https://render.githubusercontent.com/render/math?math=\sigma"> is scale parameter. 
* <img src="https://render.githubusercontent.com/render/math?math=\epsilon_i"> is random disturbance
* Note: The scale parameter is the reciprocal of the shape parameter.

| eps distribution     | T distribution | Lifereg syntax         | Notes
| --- | --- | ---- | ----
| extreme value(2 params)| Weibull        | dist = Weibull     | ?
| extreme val(1 param)| exponential     | dist = exponential | ?
| log-gamma           | gamma           | dist = gamma       | ?


Interpretation of the regression coefficients