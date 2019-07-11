From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 06/14] clk: qcom: hfpll: get parent clock names from DT
Date: Thu, 11 Jul 2019 08:07:23 -0700
Message-ID: <20190711150723.GG7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-7-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-7-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, sibis@codeaurora.org, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org, georgi.djakov@linaro.org, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Allow accessing the parent clock name required for the driver
> operation using the device tree node.
> 
> This permits extending the driver to other platforms without having to
> modify its source code.
> 
> For backwards compatibility leave the previous value as default.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

The driver should be updated to use parent_data instead, but I consider
that's an independent change.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/hfpll.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
> index a6de7101430c..87b7f46d27e0 100644
> --- a/drivers/clk/qcom/hfpll.c
> +++ b/drivers/clk/qcom/hfpll.c
> @@ -52,6 +52,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>  	void __iomem *base;
>  	struct regmap *regmap;
>  	struct clk_hfpll *h;
> +	struct clk *pclk;
>  	struct clk_init_data init = {
>  		.parent_names = (const char *[]){ "xo" },
>  		.num_parents = 1,
> @@ -75,6 +76,13 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
>  					  0, &init.name))
>  		return -ENODEV;
>  
> +	/* get parent clock from device tree (optional) */
> +	pclk = devm_clk_get(dev, "xo");
> +	if (!IS_ERR(pclk))
> +		init.parent_names = (const char *[]){ __clk_get_name(pclk) };
> +	else if (PTR_ERR(pclk) == -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> +
>  	h->d = &hdata;
>  	h->clkr.hw.init = &init;
>  	spin_lock_init(&h->lock);
> -- 
> 2.21.0
> 
