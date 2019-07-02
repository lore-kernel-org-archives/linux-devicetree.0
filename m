Return-Path: <SRS0=An4t=U7=arm.com=sudeep.holla@kernel.org>
Date: Tue, 2 Jul 2019 12:06:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RESEND PATCH 2/3] soc: imx: Add power domain driver support for
 i.mx8m family
Message-ID: <20190702110653.GA7329@e107155-lin>
References: <20190702100832.29718-1-ping.bai@nxp.com>
 <20190702100832.29718-3-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702100832.29718-3-ping.bai@nxp.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Leonard Crestez <leonard.crestez@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 02, 2019 at 10:03:46AM +0000, Jacky Bai wrote:
> The i.MX8M family is a set of NXP product focus on delivering
> the latest and greatest video and audio experience combining
> state-of-the-art media-specific features with high-performance
> processing while optimized for lowest power consumption.
> 
> i.MX8MQ, i.MX8MM, i.MX8MN, even the furture i.MX8MP are all
> belong to this family. A GPC module is used to manage all the
> PU power domain on/off. But the situation is that the number of
> power domains & the power up sequence has significate difference
> on those SoCs. Even on the same SoC. The power up sequence still
> has big difference. It makes us hard to reuse the GPCv2 driver to
> cover the whole i.MX8M family. Each time a new SoC is supported in
> the mainline kernel, we need to modify the GPCv2 driver to support
> it. We need to add or modify hundred lines of code in worst case.
> It is a bad practice for the driver maintainability.
> 
> This driver add a more generic power domain driver that the actual
> power on/off is done by TF-A code. the abstraction give us the
> possibility that using one driver to cover the whole i.MX8M family
> in kernel side.
>

TF-A has SCMI support, why can't that be used as abstraction instead
of inventing new. Peng Fan has been working to get SMC mailbox.

Unless you give me strong reasons for not able to pursue that path,
NACK for this patch. I have told this in the recent past.

> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  drivers/soc/imx/Kconfig            |   6 +
>  drivers/soc/imx/Makefile           |   1 +
>  drivers/soc/imx/imx8m_pm_domains.c | 224 +++++++++++++++++++++++++++++
>  include/soc/imx/imx_sip.h          |  12 ++
>  4 files changed, 243 insertions(+)
>  create mode 100644 drivers/soc/imx/imx8m_pm_domains.c
>  create mode 100644 include/soc/imx/imx_sip.h

[...]

> +
> +	mutex_lock(&gpc_pd_mutex);
> +	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_CONFIG_GPC_PM_DOMAIN, domain->domain_index,
> +		      PD_STATE_ON, 0, 0, 0, 0, &res);
> +	mutex_unlock(&gpc_pd_mutex);
> +
> +	return 0;
> +}
> +
> +static int imx8m_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +	struct imx8m_pm_domain *domain = to_imx8m_pm_domain(genpd);
> +	struct arm_smccc_res res;
> +	int index, ret = 0;
> +
> +	mutex_lock(&gpc_pd_mutex);
> +	arm_smccc_smc(IMX_SIP_GPC, IMX_SIP_CONFIG_GPC_PM_DOMAIN, domain->domain_index,
> +		      PD_STATE_OFF, 0, 0, 0, 0, &res);

How big is this IMX SMC SIP ? I keep seeing that it's ever growing.
I don't want to see this for any future products as they seem to be
designed "ON THE GO" as and when needed rather than completely thought
through.

--
Regards,
Sudeep
