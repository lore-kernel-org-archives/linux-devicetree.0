From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] ARM: imx6: gpc: Add PU power domain for GPU/VPU
Date: Wed, 12 Feb 2014 11:13:37 +0100
Message-ID: <1392200017.5536.32.camel@pizza.hi.pengutronix.de>
References: <1392125231-28387-1-git-send-email-p.zabel@pengutronix.de>
	 <1392125231-28387-2-git-send-email-p.zabel@pengutronix.de>
	 <20140212071731.GH31484@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140212071731.GH31484-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

thanks you for the comments.

Am Mittwoch, den 12.02.2014, 15:17 +0800 schrieb Shawn Guo:
> > +static int imx6q_pm_pu_power_off(struct generic_pm_domain *genpd)
> > +{
> > +	u32 val;
> > +	int iso, iso2sw;
> > +
> > +	/* GPU3D, GPU2D, and VPU clocks should be disabled here */
> 
> The comment should be dropped?

Ok.

[...]
> > +static int imx_gpc_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_get_child_by_name(pdev->dev.of_node, "power-domain");
> > +	if (!np) {
> > +		dev_err(&pdev->dev, "missing power-domain node\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	pu_reg = devm_regulator_get(&pdev->dev, "pu");
> > +	if (IS_ERR(pu_reg)) {
> > +		ret = PTR_ERR(pu_reg);
> > +		dev_err(&pdev->dev, "failed to get pu regulator: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* The regulator is initially enabled */
> > +	ret = regulator_enable(pu_reg);
> 
> That means the PU power domain will be always on when neither GPU nor
> VPU is enabled?

You are right, if there is no device in the power domain, it will never
be disabled by the genpd framework. Disabling the domain by default
should help:

> > +	if (ret < 0) {
> > +		dev_err(&pdev->dev, "failed to enable pu regulator: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	imx6q_pu_domain.of_node = np;
> > +	pm_genpd_init(&imx6q_pu_domain, NULL, false);
> > +	bus_register_notifier(&platform_bus_type, &imx6q_platform_nb);

diff --git a/arch/arm/mach-imx/gpc.c b/arch/arm/mach-imx/gpc.c
index 65e0f2c..2fc4ea1 100644
--- a/arch/arm/mach-imx/gpc.c
+++ b/arch/arm/mach-imx/gpc.c
@@ -356,7 +356,8 @@ static int imx_gpc_probe(struct platform_device
*pdev)
        }
 
        imx6q_pu_domain.of_node = np;
-       pm_genpd_init(&imx6q_pu_domain, NULL, false);
+       imx6q_pm_pu_power_off(&imx6q_pu_domain);
+       pm_genpd_init(&imx6q_pu_domain, NULL, true);
        bus_register_notifier(&platform_bus_type, &imx6q_platform_nb);
 
        return 0;

> > +
> > +	return 0;
> > +}
> > +
> > +static struct of_device_id imx_gpc_dt_ids[] = {
> > +	{ .compatible = "fsl,imx6q-gpc" },
> > +	{ }
> > +};
> > +
> > +static struct platform_driver imx_gpc_driver = {
> > +	.driver = {
> > +		.name = "imx-gpc",
> > +		.owner = THIS_MODULE,
> > +		.of_match_table = imx_gpc_dt_ids,
> > +	},
> > +	.probe = imx_gpc_probe,
> > +};
> > +
> > +static int __init imx_pgc_init(void)
> > +{
> > +	return platform_driver_register(&imx_gpc_driver);
> > +}
> > +subsys_initcall(imx_pgc_init);
> > -- 
> > 1.8.5.3
> > 

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
