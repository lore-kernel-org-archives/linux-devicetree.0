From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 05/14] clk: qcom: apcs-msm8916: get parent clock names
 from DT
Date: Thu, 11 Jul 2019 07:58:38 -0700
Message-ID: <20190711145838.GF7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-6-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-6-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Allow accessing the parent clock names required for the driver
> operation by using the device tree node.
> 
> This permits extending the driver to other platforms without having to
> modify its source code.
> 
> For backwards compatibility leave previous values as default.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/apcs-msm8916.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> index a6c89a310b18..dd82eb1e5202 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -19,7 +19,7 @@
>  
>  static const u32 gpll0_a53cc_map[] = { 4, 5 };
>  
> -static const char * const gpll0_a53cc[] = {
> +static const char *gpll0_a53cc[] = {
>  	"gpll0_vote",
>  	"a53pll",
>  };
> @@ -50,6 +50,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	struct clk_init_data init = { };
>  	int ret = -ENODEV;
> +	const char *parents[2];
> +	int pll_index = 0;
>  
>  	regmap = dev_get_regmap(parent, NULL);
>  	if (!regmap) {
> @@ -61,6 +63,16 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	if (!a53cc)
>  		return -ENOMEM;
>  
> +	/* legacy bindings only defined the pll parent clock (index = 0) with no
> +	 * name; when both of the parents are specified in the bindings, the
> +	 * pll is the second one (index = 1).
> +	 */
> +	if (of_clk_parent_fill(parent->of_node, parents, 2) == 2) {
> +		gpll0_a53cc[0] = parents[0];
> +		gpll0_a53cc[1] = parents[1];
> +		pll_index = 1;
> +	}
> +
>  	init.name = "a53mux";
>  	init.parent_names = gpll0_a53cc;
>  	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
> @@ -76,10 +88,11 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	a53cc->src_shift = 8;
>  	a53cc->parent_map = gpll0_a53cc_map;
>  
> -	a53cc->pclk = devm_clk_get(parent, NULL);
> +	a53cc->pclk = of_clk_get(parent->of_node, pll_index);
>  	if (IS_ERR(a53cc->pclk)) {
>  		ret = PTR_ERR(a53cc->pclk);
> -		dev_err(dev, "failed to get clk: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get clk: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -87,6 +100,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
>  	if (ret) {
>  		dev_err(dev, "failed to register clock notifier: %d\n", ret);
> +		clk_put(a53cc->pclk);
>  		return ret;
>  	}
>  
> @@ -109,6 +123,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  
>  err:
>  	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	clk_put(a53cc->pclk);
> +
>  	return ret;
>  }
>  
> @@ -117,6 +133,7 @@ static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
>  	struct clk_regmap_mux_div *a53cc = platform_get_drvdata(pdev);
>  
>  	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	clk_put(a53cc->pclk);
>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 
