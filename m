From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 3/3] mailbox: qcom: Add support for APCS clock
 controller
Date: Fri, 23 Jun 2017 10:45:28 -0700
Message-ID: <20170623174528.GC18666@tuxbook>
References: <20170623161533.20449-1-georgi.djakov@linaro.org>
 <20170623161533.20449-4-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170623161533.20449-4-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri 23 Jun 09:15 PDT 2017, Georgi Djakov wrote:

> +static int msm8916_register_clk(struct device *dev, void __iomem *base)
> +{
[..]
> +	regmap = devm_regmap_init_mmio(dev, base, &a53cc_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "failed to init regmap mmio: %d\n", ret);
> +		goto err;
> +	}

I think it would be cleaner if you create the regmap in probe() and we
use that throughout the driver - rather than using two different access
mechanism.

> +
> +	a53cc->clkr.regmap = regmap;
> +
> +	ret = devm_clk_register_regmap(dev, &a53cc->clkr);
> +	if (ret) {
> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
> +				     &a53cc->clkr.hw);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	clk_notifier_unregister(pclk, &a53cc->clk_nb);
> +	return ret;
> +}
> +
>  static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
>  	struct qcom_apcs_ipc *apcs;
>  	struct resource *res;
>  	unsigned long offset;
> @@ -63,6 +178,13 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
> +		/* register the APCS mux and divider clock */
> +		ret = msm8916_register_clk(&pdev->dev, base);
> +		if (ret)
> +			return ret;
> +	}
> +

Don't you need to clean up anything in the below error path and in
remove()?

>  	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
>  
>  	apcs->reg = base + offset;

Other than that I think this looks reasonable.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
