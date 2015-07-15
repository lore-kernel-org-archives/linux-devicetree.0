From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: qcom: Add coincell charger driver
Date: Tue, 14 Jul 2015 18:11:22 -0700
Message-ID: <55A5B33A.3070303@codeaurora.org>
References: <1436916380-3599-1-git-send-email-tim.bird@sonymobile.com> <1436916380-3599-2-git-send-email-tim.bird@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436916380-3599-2-git-send-email-tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/14/2015 04:26 PM, Tim Bird wrote:

>   3 files changed, 166 insertions(+)
>   create mode 100644 drivers/misc/qcom-coincell.c
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 42c3852..0909869 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -271,6 +271,17 @@ config HP_ILO
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called hpilo.
>   
> +config QCOM_COINCELL
> +	tristate "Qualcomm coincell charger support"
> +	depends on OF

It looks like it would compile fine without OF, so can we drop this 
dependency? Or make it into

  depends on MFD_SPMI_PMIC || COMPILE_TEST

?

> +	select REGMAP
> +	help
> +	  This driver supports the coincell block found inside of
> +	  Qualcomm PMICs.  The coincell charger provides a means to
> +	  charge a coincell battery or backup capacitor which is used
> +	  to maintain PMIC register and RTC state in the absence of
> +	  external power.
> +
>   config SGI_GRU
>   	tristate "SGI GRU driver"
>   	depends on X86_UV && SMP
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index d056fb7..537d7f3 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_LKDTM)		+= lkdtm.o
>   obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
>   obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
>   obj-$(CONFIG_PHANTOM)		+= phantom.o
> +obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
>   obj-$(CONFIG_SENSORS_BH1780)	+= bh1780gli.o
>   obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
>   obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
> diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
> new file mode 100644
> index 0000000..9c019e4
> --- /dev/null
> +++ b/drivers/misc/qcom-coincell.c
> @@ -0,0 +1,154 @@
> +/* Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2015, Sony Mobile Communications Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +struct qcom_coincell {
> +	struct device	*dev;
> +	struct regmap	*regmap;
> +	u32		base_addr;
> +};
> +
> +#define QCOM_COINCELL_REG_RSET		0x44
> +#define QCOM_COINCELL_REG_VSET		0x45
> +#define QCOM_COINCELL_REG_ENABLE	0x46
> +
> +#define QCOM_COINCELL_ENABLE		BIT(7)
> +
> +static const int qcom_rset_map[] = {2100, 1700, 1200, 800};
> +static const int qcom_vset_map[] = {2500, 3200, 3100, 3000};

Nitpick: put spaces around those braces.

> +/* NOTE: for pm8921 and others, voltage of 2500 is 16 (10000b), not 0 */
> +
> +static int qcom_coincell_chgr_config(struct qcom_coincell *chgr, int rset,
> +				     int vset, int enable)

bool enable?

> +{
> +	int i, rc;
> +	unsigned int value;
> +
> +	/* select current-limiting resistor */
> +	for (i = 0; i < ARRAY_SIZE(qcom_rset_map); i++)
> +		if (rset == qcom_rset_map[i])
> +			break;
> +
> +	if (i >= ARRAY_SIZE(qcom_rset_map)) {
> +		dev_err(chgr->dev, "invalid rset-ohms value %d\n", rset);
> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_write(chgr->regmap,
> +			  chgr->base_addr + QCOM_COINCELL_REG_RSET, i);
> +	if (rc)
> +		dev_err(chgr->dev, "could not write to RSET register\n");
> +		return rc;

Missing braces?

> +
> +	/* select charge voltage */
> +	for (i = 0; i < ARRAY_SIZE(qcom_vset_map); i++)
> +		if (vset == qcom_vset_map[i])
> +			break;
> +
> +	if (i >= ARRAY_SIZE(qcom_vset_map)) {
> +		dev_err(chgr->dev, "invalid vset-millivolts value %d\n", vset);
> +		return -EINVAL;
> +	}
> +
> +	rc = regmap_write(chgr->regmap,
> +		chgr->base_addr + QCOM_COINCELL_REG_VSET, i);
> +	if (rc)
> +		dev_err(chgr->dev, "could not write to VSET register\n");
> +		return rc;

Missing braces? I guess this hardware just works out of the bootloader 
after the resistor is configured?

> +
> +	/* set 'enable' register */
> +	value = enable ? QCOM_COINCELL_ENABLE : 0;
> +	rc = regmap_write(chgr->regmap,
> +			  chgr->base_addr + QCOM_COINCELL_REG_ENABLE, value);
> +	if (rc)
> +		dev_err(chgr->dev, "could not write to ENABLE register\n");
> +

Honestly these printks seems pretty useless and could probably be left out.

> +	return rc;
> +}
> +
> +static int qcom_coincell_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct qcom_coincell *chgr;
> +	u32 rset, vset, enable;
> +	int rc;
> +
> +	if (!node) {
> +		dev_err(&pdev->dev, "%s: device node missing\n", __func__);
> +		return -ENODEV;
> +	}

Does this happen?

> +
> +	chgr = devm_kzalloc(&pdev->dev, sizeof(*chgr), GFP_KERNEL);
> +	if (!chgr)
> +		return -ENOMEM;
> +
> +	chgr->dev = &pdev->dev;
> +
> +	chgr->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!chgr->regmap) {
> +		dev_err(chgr->dev, "Unable to get regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = of_property_read_u32(node, "reg", &chgr->base_addr);
> +	if (rc)
> +		return rc;
> +
> +	rc = of_property_read_u32(node, "qcom,rset-ohms", &rset);
> +	if (rc) {
> +		dev_err(chgr->dev, "can't find 'qcom,rset-ohms' in DT block");
> +		return rc;
> +	}
> +
> +	rc = of_property_read_u32(node, "qcom,vset-millivolts", &vset);
> +	if (rc) {
> +		dev_err(chgr->dev,
> +			"can't find 'qcom,vset-millivolts' in DT block");
> +		return rc;
> +	}
> +
> +	rc = of_property_read_u32(node, "qcom,charge-enable", &enable);

This should be a bool:

     enable = of_property_read_bool(node, "qcom,charge-enable");

> +	if (rc)
> +		enable = 0;
> +
> +	rc = qcom_coincell_chgr_config(chgr, rset, vset, enable);
> +
> +	return rc;
> +}
> +
> +static const struct of_device_id qcom_coincell_match_table[] = {
> +	{ .compatible = "qcom,pm8941-coincell", },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, qcom_coincell_match_table);
> +
> +static struct platform_driver qcom_coincell_driver = {
> +	.driver	= {
> +		.name		= "qcom,pm8941-coincell",

Maybe a better driver name would be qcom-spmi-coincell?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
