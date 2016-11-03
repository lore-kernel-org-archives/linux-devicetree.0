From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/6] msm8994 clocks: global clock support for msm8994 SOC.
Date: Thu, 3 Nov 2016 22:42:34 +0000
Message-ID: <20161103224234.GB30414@remoulade>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-4-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1477394221-30963-4-git-send-email-jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy McNicoll <jeremymc-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, michael.scott-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 04:16:58AM -0700, Jeremy McNicoll wrote:
> +static const struct qcom_cc_desc gcc_msm8994_desc = {
> +	.config = &gcc_msm8994_regmap_config,
> +	.clks = gcc_msm8994_clocks,
> +	.num_clks = ARRAY_SIZE(gcc_msm8994_clocks),
> +	.resets = NULL,
> +	.num_resets = 0,
> +	.gdscs = NULL,
> +	.num_gdscs = 0,
> +};
> +
> +static const struct of_device_id gcc_msm8994_match_table[] = {
> +	{ .compatible = "qcom,gcc-8994" },
> +	{ .compatible = "qcom,gcc-8994v2" },
> +	{}
> +}
> +
> +MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
> +
> +static int gcc_msm8994_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk *clk;
> +	const char *compat = NULL;
> +	int compatlen = 0;
> +	bool is_v2 = false;
> +
> +	clk = devm_clk_register(dev, &xo.hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	compat = of_get_property(pdev->dev.of_node, "compatible", &compatlen);
> +	if (!compat || (compatlen <= 0))
> +		return -EINVAL;

It is almost never correct to use of_get_property(). Please avoid it.

> +
> +	is_v2 = !strcmp(compat, "qcom,gcc-8994v2");
> +	if (is_v2)
> +		msm_gcc_8994v2_fixup();

Either put some data in the of_device_id tables, and use that to determine what
to do here, or use of_device_is_compatible() or of_match_node() to check the
string.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
