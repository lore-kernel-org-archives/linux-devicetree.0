From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ARM: imx6: register pm_power_off handler if
 "fsl,pmic_stby_poweroff" is set
Date: Wed, 31 May 2017 15:55:42 +0100
Message-ID: <20170531145542.GD10351@leverpostej>
References: <20170531061457.23744-1-o.rempel@pengutronix.de>
 <20170531061457.23744-3-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531061457.23744-3-o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 08:14:53AM +0200, Oleksij Rempel wrote:
> One of the Freescale recommended sequences for power off with external
> PMIC is the following:
> ...
> 3.  SoC is programming PMIC for power off when standby is asserted.
> 4.  In CCM STOP mode, Standby is asserted, PMIC gates SoC supplies.
> 
> See:
> http://www.nxp.com/assets/documents/data/en/reference-manuals/IMX6DQRM.pdf
> page 5083

> +static int imx6_pm_poweroff_probe(void)
> +{
> +	char symname[KSYM_NAME_LEN];
> +
> +	if (pm_power_off) {
> +		lookup_symbol_name((ulong)pm_power_off, symname);
> +		pr_warn("%s: pm_power_off already claimed  %p %s!\n",
> +			__func__, pm_power_off, symname);

Please use %pf rather than lookup_symbol_name*(,

> +		return -EBUSY;
> +	}
> +
> +	pm_power_off = imx6_pm_poweroff;
> +	return 0;
> +}
> +
>  void __init imx6_pm_ccm_init(const char *ccm_compat)
>  {
>  	struct device_node *np;
> @@ -618,6 +645,9 @@ void __init imx6_pm_ccm_init(const char *ccm_compat)
>  	val = readl_relaxed(ccm_base + CLPCR);
>  	val &= ~BM_CLPCR_LPM;
>  	writel_relaxed(val, ccm_base + CLPCR);
> +
> +	if (of_property_read_bool(np, "fsl,pmic_stby_poweroff"))
> +		imx6_pm_poweroff_probe();

This neesd s/_/-/, as commented on the binding.

My what/why query on the binding stadns, regardless.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
